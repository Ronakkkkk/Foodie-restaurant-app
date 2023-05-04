import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:foodie/constants/Colors.dart';
import 'package:foodie/constants/texts.dart';

import 'package:provider/provider.dart';

class Foodmenu extends StatelessWidget {
  final int selected;
  final Function callback;
  final PageController pageController;
  Foodmenu(this.selected, this.callback, this.pageController);
  List menulist = [];

Future<void> fetchMenuData() async {
  DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection("menus").doc("recommended").get();
  log(documentSnapshot.data().toString());
}
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("menus").doc("recommended").snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(),);
        }

        if (!snapshot.hasData) {
          return Text('No data available');
        }
        Map<String, dynamic> data = snapshot.data?.data() as Map<String, dynamic>;

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
                          _menucontent(index, data['food-items'])),
                      separatorBuilder: ((context, index) {
                        return SizedBox(
                          width: 10,
                        );
                      }),
                      itemCount: data['food-items'].length)
                ],
              ))
        ]);
      }
    );
  }
}

Widget _menucontent(int index, List menu) {
  return Container(
    padding: EdgeInsets.all(7),
    height: 260,
    width: 168,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: index % 2 == 0 ? kprimarycolor : Colors.white),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: EdgeInsets.only(right: 20, left: 20, top: 7, bottom: 0),
          child: Image(
            image: NetworkImage(menu[index]['image']),
            fit: BoxFit.contain,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                menu[index]['name'],
                textAlign: TextAlign.left,
                style: kbigtext.copyWith(
                    fontSize: 20,
                    color: index % 2 == 0 ? Colors.white : kprimarycolor),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                menu[index]['cuisine'],
                style:
                    ksmalltext.copyWith(fontSize: 16, color: Color(0xff747478)),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "\$",
                    style: ksmalltext.copyWith(
                        fontSize: 15,
                        color: index % 2 == 0 ? Colors.white : kprimarycolor,
                        fontWeight: FontWeight.bold,
                        fontFeatures: [FontFeature.superscripts()]),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '14',
                    style: ksmalltext.copyWith(
                        fontSize: 22,
                        color: index % 2 == 0 ? Colors.white : kprimarycolor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ".45",
                    style: ksmalltext.copyWith(
                        fontSize: 17,
                        color: index % 2 == 0 ? Colors.white : kprimarycolor,
                        fontWeight: FontWeight.bold,
                        fontFeatures: [FontFeature.superscripts()]),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 52,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color:
                            index % 2 == 0 ? Color(0xff747478) : kprimarycolor),
                    child: Center(
                      child: Text(
                        'Sell',
                        style: kbigtext.copyWith(
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
