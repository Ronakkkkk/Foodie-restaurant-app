import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:foodie/Firebase/Menuitem.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Menucontroller {
  Future getmenu() async {
    List menulist = [];
    try {
      await FirebaseFirestore.instance
          .collection('menus')
          .get()
          .then((QuerySnapshot<Map<String, dynamic>> snapshot) {
        snapshot.docs.forEach((element) {
          menulist.add(MenuItems.fromJson(element.data()));
        });
      });
      return menulist;
    } catch (e) {
      return null;
    }
  }
}
