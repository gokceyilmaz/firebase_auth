import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseauth/modeller/kullanici.dart';

class FireStoreServisi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> kullaniciOlustur({
    id,
    email,
    adsoyad,
  }) async {
    await _firestore.collection("kullanicilar").doc(id).set({
      "kullaniciAdi": adsoyad,
      "email": email,
      "olusturulmaZamani": DateTime.now()
    });
  }

  Future<Kullanici> kullanicilariGetir(id) async {
    DocumentSnapshot doc =
        await _firestore.collection("kullanicilar").doc(id).get();
    if (doc.exists) {
      Kullanici kullanici = Kullanici.dokumandanuret(doc);
      return kullanici;
    }
    return null;
  }
}
