import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Kullanici {
  final String id;
  final String adSoyad;
  final String email;

  Kullanici({
    @required this.id,
    this.adSoyad,
    this.email,
  });

  factory Kullanici.firebasedenuret(User kullanici) {
    return Kullanici(
      id: kullanici.uid,
      adSoyad: kullanici.displayName,
      email: kullanici.email,
    );
  }

  factory Kullanici.dokumandanuret(DocumentSnapshot doc) {
    return Kullanici(
      id: doc.id,
      adSoyad: doc.data()['kullaniciAdi'],
      email: doc.data()['email'],
    );
  }
}
