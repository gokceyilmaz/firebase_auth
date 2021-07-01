import 'package:firebaseauth/sayfalar/hesapOlustur.dart';
import 'package:firebaseauth/servisler/firebaseAuthServisi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GirisSayfasi extends StatefulWidget {
  @override
  _GirisSayfasiState createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  bool yukleniyor = false;
  String email, sifre;
  final _formAnahtari = GlobalKey<FormState>();
  final _scaffoldAnahtari = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldAnahtari,
        body: Stack(
          children: [
            loginScreen(context),
            //_yuklemeanimasyonu(),
          ],
        ));
  }

  Form loginScreen(BuildContext context) {
    return Form(
      key: _formAnahtari,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Giriş Sayfası"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "E-mail",
                      labelText: 'E-mail*',
                      border: OutlineInputBorder(),
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
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Şifre",
                      border: OutlineInputBorder(),
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
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      //padding: EdgeInsets.all((18.0)),
                      height: 50,
                      decoration: BoxDecoration(color: Colors.purple.shade200),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HesapOlustur()));
                        },
                        child: Text("Kayıt ol",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.purple.shade300,
                      ),
                      child: TextButton(
                        onPressed: _girisyap,
                        child: Text("Giriş Yap",
                            style: TextStyle(color: Colors.white)),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }

  void _girisyap() async {
    final _yetkilendirmeServisi =
        Provider.of<YetkilendirmeServisi>(context, listen: false);
    if (_formAnahtari.currentState.validate()) {
      _formAnahtari.currentState.save();
      setState(() {
        yukleniyor = true;
      });
      try {
        await _yetkilendirmeServisi.mailileGiris(email, sifre);
      } catch (err) {
        uyariGoster(hatakodu: err.code);
      }
    }
  }

  uyariGoster({hatakodu}) {
    String errMsg;
    if (hatakodu == 'invalid-email') {
      errMsg = "Email Adresi Geçersiz";
    } else if (hatakodu == 'wrong-password') {
      errMsg = "Şifre Hatalı";
    } else if (hatakodu == 'user-not-found') {
      errMsg = "Kullanıcı bulunamadı";
    } else if (hatakodu == 'user-disabled') {
      errMsg = "Kullanıcı engellenmiş";
    } else {
      errMsg = "Tanımlanamayan Hata $hatakodu";
    }
    var snackBar = SnackBar(
      content: Text(errMsg),
    );
    //_scaffoldAnahtari.currentState.showSnackBar(snackBar);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
