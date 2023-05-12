import 'dart:core';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:foodie/constants/colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/menu_screen/main_menu_screen.dart';

import 'package:foodie/widgets/string_casing.dart';
import 'package:foodie/widgets/cloud_image_loader.dart';

class FoodMenu extends StatefulWidget {
  final int selected;
  final Function callback;
  final PageController pageController;

  FoodMenu(this.selected, this.callback, this.pageController, {Key? key})
      : super(key: key);

  @override
  State<FoodMenu> createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  late List<Map<String, dynamic>> menuData = [];

  @override
  void initState() {
    super.initState();

    fetchMenuData(widget.selected);
  }

  @override
  void didUpdateWidget(FoodMenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selected != widget.selected) {
      fetchMenuData(widget.selected);
    }
  }

  Future<void> fetchMenuData(int selected) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('menus')
        .where("index", isEqualTo: selected.toString())
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      setState(() {
        menuData = List<Map<String, dynamic>>.from(
            documentSnapshot.get('food-items') as List<dynamic>);
      });
    } else {
      print('Document not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 252,
          child: PageView.builder(
            controller: widget.pageController,
            onPageChanged: (value) {
              widget.callback(value);
            },
            itemCount: menuData.length,
            itemBuilder: (context, index) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, innerIndex) =>
                    _menuContent(innerIndex, menuData, context),
                separatorBuilder: (context, innerIndex) => const SizedBox(
                  width: 10,
                ),
                itemCount: menuData.length,
              );
            },
          ),
        ),
      ],
    );
  }
}

Widget _menuContent(int index, List<Map<String, dynamic>> menu, context) {
  return GestureDetector(
    onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => MenuScreen(menu[index]['d_id'])))),
    child: Container(
      padding: const EdgeInsets.all(7),
      height: 260,
      width: 168,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: index % 2 == 0 ? kPrimaryColor : Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              margin:
                  const EdgeInsets.only(right: 20, left: 20, top: 7, bottom: 0),
              child: CloudImageLoader(menu[index]['image'])),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menu[index]['name'].toString().toTitleCase(),
                  textAlign: TextAlign.left,
                  style: kBigText.copyWith(
                      fontSize: 20,
                      color: index % 2 == 0 ? Colors.white : kPrimaryColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  menu[index]['cuisine'].toString(),
                  style: kSmallText.copyWith(
                      fontSize: 16, color: const Color(0xff747478)),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "\$",
                      style: kSmallText.copyWith(
                          fontSize: 15,
                          color: index % 2 == 0 ? Colors.white : kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontFeatures: [const FontFeature.superscripts()]),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '14',
                      style: kSmallText.copyWith(
                          fontSize: 22,
                          color: index % 2 == 0 ? Colors.white : kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ".45",
                      style: kSmallText.copyWith(
                          fontSize: 17,
                          color: index % 2 == 0 ? Colors.white : kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontFeatures: [const FontFeature.superscripts()]),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 52,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: index % 2 == 0
                              ? const Color(0xff747478)
                              : kPrimaryColor),
                      child: Center(
                        child: Text(
                          'Buy',
                          style: kBigText.copyWith(
                              fontSize: 14, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Future<String> fetchImage(String url) async {
  final gsRef = FirebaseStorage.instance.refFromURL(url);
  String imageUrl = await gsRef.getDownloadURL();
  return imageUrl;
}
