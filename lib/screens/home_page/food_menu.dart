import 'dart:core';
import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:foodie/constants/colors.dart';
import 'package:foodie/constants/texts.dart';

class FoodMenu extends StatelessWidget {
  final int selected;
  final Function callback;
  final PageController pageController;

  FoodMenu(this.selected, this.callback, this.pageController, {super.key});

  List menuList = [];

  Future<void> fetchMenuData() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection("menus")
        .doc("recommended")
        .get();
    log(documentSnapshot.data().toString());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("menus")
            .doc("recommended")
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData) {
            return const Text('No data available');
          }
          Map<String, dynamic> data =
              snapshot.data?.data() as Map<String, dynamic>;

          log(data.toString());
          return Column(children: [
            Container(
              height: 252,
              child: PageView(
                controller: pageController,
                onPageChanged: (value) => callback(value),
                children: [
                  ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) =>
                          _menuContent(index, data['food-items'])),
                      separatorBuilder: ((context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      }),
                      itemCount: data['food-items'].length)
                ],
              ),
            ),
          ]);
        });
  }
}

Widget _menuContent(int index, List menu) {
  return Container(
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
          margin: const EdgeInsets.only(right: 20, left: 20, top: 7, bottom: 0),
          child: Image(
            image: NetworkImage(menu[index]['image']),
            fit: BoxFit.contain,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                menu[index]['name'],
                textAlign: TextAlign.left,
                style: kBigText.copyWith(
                    fontSize: 20,
                    color: index % 2 == 0 ? Colors.white : kPrimaryColor),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                menu[index]['cuisine'],
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
                        'Sell',
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
  );
}
