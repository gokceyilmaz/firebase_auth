import 'package:firebaseauth/sayfalar/anaSayfa.dart';
import 'package:firebaseauth/sayfalar/girisSayfasi.dart';
import 'package:firebaseauth/servisler/firebaseAuthServisi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modeller/kullanici.dart';

//import 'package:socialapp/sayfalar/deneme.dart';
//import 'package:socialapp/sayfalar/girissayfasi.dart';
//import 'package:socialapp/sayfalar/girisSayfasi.dart';
class Yonlendirme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _yetkilendirmeServisi =
        Provider.of<YetkilendirmeServisi>(context, listen: false);

    //Uygulamada Giriş yapılmış ise direk anasayfaya yönlendiriyoruz aktif giriş yok ise giriş ekranına yönlendiriliyor.

    return StreamBuilder(
        stream: _yetkilendirmeServisi.durumTakipcisi,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            Kullanici aktifKullanici = snapshot.data;
            _yetkilendirmeServisi.aktifkullaniciid = aktifKullanici.id;
            return AnaSayfa();
          }
          else {
            return GirisSayfasi();
          }
        });

  }
}
