import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:foodie/Firebase/Menuitem.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Menucontroller {
  final CollectionReference _menulsit =
      FirebaseFirestore.instance.collection('Menu');
//   Future getmenu() async {
//   List<MenuItems> menulist = [];
//   try {
//     await _menulsit.get().then((QuerySnapshot snapshot) {
//       snapshot.docs.forEach((element) {
//         menulist.add(MenuItems.fromJson(element.data()));
//       });
//     });
//     return menulist;
//   } catch (e) {
//     return menulist;
//   }
// }
  Future getmenu() async {
    List Menulist = [];
    try {
      await _menulsit.get().then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((element) {
          Menulist.add(element.data());
        });
      });
      return Menulist;
    } catch (e) {
      return null;
    }
  }
}
