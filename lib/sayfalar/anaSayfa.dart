import 'package:firebaseauth/modeller/kullanici.dart';
import 'package:firebaseauth/servisler/fireStoreServisi.dart';
import 'package:firebaseauth/servisler/firebaseAuthServisi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  String _aktifKullaniciId;
  Kullanici kullanici;
  @override
  void initState() {
    super.initState();
    _aktifKullaniciId =
        Provider.of<YetkilendirmeServisi>(context, listen: false)
            .aktifkullaniciid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ana Sayfa"),
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: _cikisYap),
        ],
      ),
      body: FutureBuilder(
        future: FireStoreServisi().kullanicilariGetir(_aktifKullaniciId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          kullanici = snapshot.data;
          return Center(
            child: Text(
              "Hoşgeldin  " + kullanici.adSoyad,
              style: TextStyle(fontSize: 24),
            ),
          );
        },
      ),
    );
  }

  void _cikisYap() {
    Provider.of<YetkilendirmeServisi>(context, listen: false).cikisYap();
  }
}
