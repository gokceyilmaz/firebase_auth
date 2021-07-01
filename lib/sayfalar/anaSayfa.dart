import 'package:firebaseauth/modeller/kullanici.dart';
import 'package:firebaseauth/sayfalar/yoneticiyeMesaj.dart';
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
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: deprecated_member_use
                RaisedButton(
                  child: Text("Yöneticiye Mesaj"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>yoneticiyeMesaj()));
                  },
                  elevation: 20,
                  textColor: Colors.white,
                  color: Colors.purple,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  child: Text("Bilgilendirme"),
                  onPressed: () {},
                  elevation: 20,
                  textColor: Colors.white,
                  color: Colors.purple.shade400,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () {},
                  elevation: 20,
                  child: Text("Aidat",textAlign: TextAlign.center,),
                  textColor: Colors.white,
                  color: Colors.purple.shade300,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () {},
                  elevation: 20,
                  child: Text("Şikayet Bildir",textAlign: TextAlign.center,),
                  textColor: Colors.white,
                  color: Colors.purple.shade200,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () {},
                  elevation: 20,
                  child: Text("Arıza",textAlign: TextAlign.center,),
                  textColor: Colors.white,
                  color: Colors.purple.shade100,
                ),
                // ElevatedButton.icon(onPressed: (){}, label: null, icon: Icons.payment,),
              ],
            ),
            /*return Center(
            child: Text(
              "Hoşgeldin  " + kullanici.adSoyad,
              style: TextStyle(fontSize: 24),
            ),
          );*/
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.notifications_sharp),
        elevation: 10,
        backgroundColor: Colors.red,
      ),
    );
  }

  void _cikisYap() {
    Provider.of<YetkilendirmeServisi>(context, listen: false).cikisYap();
  }
}
