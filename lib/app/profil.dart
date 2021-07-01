import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/modeller/kullanici.dart';
import 'package:firebaseauth/servisler/fireStoreServisi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  /*Kullanici _userModel = Provider.of(context);
  print("Profil sdayfasındaki user değerleri:"+ _userModel.id.toString());*/

    return Scaffold(
        appBar: AppBar(
          title: Text("Profil"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.black12,
                    backgroundImage: NetworkImage("https://www.sciencekids.co.nz/images/pictures/math/number1.jpg"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "E-mailiniz",
                      hintText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Kullanıcı Adı",
                      hintText: 'Kullanıcı Adı',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    child: Text("Değişiklikleri Kaydet"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
