import 'package:firebaseauth/modeller/kullanici.dart';
import 'package:firebaseauth/servisler/fireStoreServisi.dart';
import 'package:firebaseauth/servisler/firebaseAuthServisi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HesapOlustur extends StatefulWidget {
  @override
  _HesapOlusturState createState() => _HesapOlusturState();
}

class _HesapOlusturState extends State<HesapOlustur> {
  String sifre, email, adsoyad;
  bool yukleniyor = false;
  final _formAnahtari = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formAnahtari,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Kayıt Sayfası"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            TextFormField(
              autocorrect: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Kullanıcı Adı Girin",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (girilenDeger) {
                if (girilenDeger.isEmpty) {
                  return "Kullanıcı Adı boş bırakılmaz";
                } else if (girilenDeger.trim().length < 4 ||
                    girilenDeger.trim().length > 15) {
                  return " Kullanıcı adı 4 karakterden küçük 15 karakterden büyük olamaz";
                }
                return null;
              },
              onSaved: (girilenDeger) {
                adsoyad = girilenDeger;
              },
            ),
            TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.mail),
                ),
                validator: (girilenDeger) {
                  if (girilenDeger.isEmpty) {
                    return "Email alanı boş bırakılmaz";
                  } else if (!girilenDeger.contains("@")) {
                    return "Girilen değer mail değil";
                  }
                  return null;
                },
                onSaved: (girilenDeger) {
                  email = girilenDeger;
                }),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Şifre",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.lock),
              ),
              validator: (girilenDeger) {
                if (girilenDeger.isEmpty) {
                  return "Şifre alanı boş bırakılmaz";
                } else if (girilenDeger.trim().length < 4) {
                  return "Şifre 4 karakterden az olamaz";
                }
                return null;
              },
              onSaved: (girilenDeger) {
                sifre = girilenDeger;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: TextButton(
                    onPressed: _register,
                    child: Text("KAYIT OL"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _register() async {
    final _yetkilendirmeServisi =
        Provider.of<YetkilendirmeServisi>(context, listen: false);

    var _formState = _formAnahtari.currentState;
    if (_formState.validate()) {
      _formState.save();
      setState(() {
        yukleniyor = true;
      });
      try {
        Kullanici kullanici =
            await _yetkilendirmeServisi.mailileKayit(email, sifre);
        if (kullanici != null) {
          FireStoreServisi().kullaniciOlustur(
              id: kullanici.id, email: email, adsoyad: adsoyad);
        }
        Navigator.pop(context);
      } catch (err) {
        setState(() {
          yukleniyor = false;
        });
        uyariGoster(hatakodu: err.code);
      }
    }
  }

  uyariGoster({hatakodu}) {
    String errMsg;
    if (hatakodu == "invalid-email") {
      errMsg = "Email Adresi Geçersiz";
    } else if (hatakodu == "email-already-in-use") {
      errMsg = "Email Adresi Kullanılıyor";
    } else if (hatakodu == "weak-password") {
      errMsg = "Şifre 6 karakterden az olamaz";
    }
    var snackBar = SnackBar(
      content: Text(errMsg),
    );
    // _scaffoldAnahtari.currentState.showSnackBar(snackBar);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
