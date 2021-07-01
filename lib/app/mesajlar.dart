import 'package:firebaseauth/servisler/fireStoreServisi.dart';
import 'package:firebaseauth/servisler/firebaseAuthServisi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MesajlarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*FireStoreServisi _userModel = Provider.of<FireStoreServisi>(context);
    _userModel.getAllUser();*/

    return Scaffold(
      appBar: AppBar(
        title: Text("Mesajlar"),
      ),
      body: Center(child: Text("Mesajlar Sayfası")),
    );
  }
}
/*body:
        //child: Text("Mesajlar Sayfası"),
      Container(
        child: Row(
          children: [
            Padding(
              child: ,
            )
          ],
        ),
      )*/
/*Container(
      padding: EdgeInsets.only(bottom: 8,left:  8),
      child: Row(
          children[ child: TextField(
            cursorColor: Colors.blueGrey,
            style: new TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Mesajınızı Yazın",
              border: new OutlineInputBorder(
                borderRadius:  new BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
              )
            ),
      ),],
    );*/
