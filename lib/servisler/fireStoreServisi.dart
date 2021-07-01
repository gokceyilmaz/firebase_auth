import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/modeller/kullanici.dart';

class FireStoreServisi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> kullaniciOlustur({
    id,
    email,
    adsoyad,
    userName,
  }) async {
    await _firestore.collection("kullanicilar").doc(id).set({
      "kullaniciAdi": adsoyad,
      "email": email,
      "olusturulmaZamani": DateTime.now(),
      "userName": userName ?? email.substring(0,email.indexOf('@'))+randomSayiUret(),
    });
  }

  Future<Kullanici> kullanicilariGetir(id) async {
    DocumentSnapshot doc =
        await _firestore.collection("kullanicilar").doc(id).get();
    if (doc.exists) {
      Kullanici kullanici = Kullanici.dokumandanuret(doc);
      print("okunan user:" + doc.data.toString());
      return kullanici;
    }
    return null;
  }
  Future<List<User>> getAllUser() async{
    QuerySnapshot querySnapshot = await _firestore.collection("users").get();
    List<User> tumKullaniciListesi= [];
    for(DocumentSnapshot tekUser in querySnapshot.docs){
      return tumKullaniciListesi;
     // tumKullanicilar.add(_tekUSer)
    }
  }

 String randomSayiUret() {
   int rastgeleSayi = Random().nextInt(999999);
   return rastgeleSayi.toString();
 }

/*Future<List<User>> getAllUser()async{
    var tumKullaniciListesi = await _userReposity.getAllUSer();
    return tumKullaniciListesi;
  }*/
}
