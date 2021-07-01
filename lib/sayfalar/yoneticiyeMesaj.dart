import 'package:firebaseauth/app/mesajlar.dart';
import 'package:firebaseauth/app/my_custom_bottom_navi.dart';
import 'package:firebaseauth/app/profil.dart';
import 'package:firebaseauth/app/tab_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';

class yoneticiyeMesaj extends StatefulWidget {
  @override
  _yoneticiyeMesajState createState() => _yoneticiyeMesajState();
}

class _yoneticiyeMesajState extends State<yoneticiyeMesaj> {
  TabItem _currentTab = TabItem.Mesajlar;

  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.Mesajlar: GlobalKey<NavigatorState>(),
    TabItem.Profil: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, Widget> tumSayfalar() {
    return {
      TabItem.Mesajlar: MesajlarPage(),
      TabItem.Profil: ProfilPage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[_currentTab].currentState.maybePop(),
      child: MyCustomBottomNavigation(
        sayfaOlusturucu: tumSayfalar(),
        navigatorKeys: navigatorKeys,
        currentTab: _currentTab,
        onSelectedTab: (secilenTab) {
          setState(() {
            _currentTab = secilenTab;
          });

          print("Seçilen tab item: " + secilenTab.toString());
        },
      ),
    );
  }
}
