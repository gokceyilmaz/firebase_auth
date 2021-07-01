import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseauth/servisler/firebaseAuthServisi.dart';
import 'package:firebaseauth/girisYonlendirme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<YetkilendirmeServisi>(
      create: (_) => YetkilendirmeServisi(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Akıllı Bina',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Yonlendirme(),
      ),
    );
  }
}
