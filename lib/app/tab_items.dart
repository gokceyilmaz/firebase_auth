import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TabItem{Mesajlar,Profil }
class TabItemData{
  final String title;
  final IconData icon;

  TabItemData(this.title, this.icon);

  static Map<TabItem,TabItemData>tumTablar={
    TabItem.Mesajlar: TabItemData("Mesajlar",Icons.mail),
    TabItem.Profil: TabItemData("Profil",Icons.person),

  };
}