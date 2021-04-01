import 'package:flutter/material.dart';

class GirisSayfasi extends StatefulWidget {
  @override
  _GirisSayfasiState createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş Sayfası"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.mail),
            ),
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Şifre",
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton(
                onPressed: () {},
                child: Text("Kayıt ol"),
                color: Colors.yellow,
              ),
              FlatButton(
                onPressed: () {},
                child: Text("Giriş Yap"),
                color: Colors.green,
              )
            ],
          )
        ],
      ),
    );
  }
}
