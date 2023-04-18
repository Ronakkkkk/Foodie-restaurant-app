import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:foodie/constants/Colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodie/test.dart';
import 'package:provider/provider.dart';

class Foodmenu extends StatefulWidget {
  @override
  State<Foodmenu> createState() => _FoodmenuState();
}

class _FoodmenuState extends State<Foodmenu> {
  List menulist = [];
  @override
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: 252,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) => _menucontent(index, menulist)),
              separatorBuilder: ((context, index) {
                return SizedBox(
                  width: 10,
                );
              }),
              itemCount: 5))
    ]);
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
            image: AssetImage('assets/images/burger.png'),
            fit: BoxFit.contain,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cheese Burger',
                textAlign: TextAlign.left,
                style: kbigtext.copyWith(
                    fontSize: 20,
                    color: index % 2 == 0 ? Colors.white : kprimarycolor),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'American Delights',
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
                    ".50",
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
                        'Buy',
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
