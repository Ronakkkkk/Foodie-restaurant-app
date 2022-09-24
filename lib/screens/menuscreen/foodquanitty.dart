import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:foodie/constants/Colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/cart%20screen/maincartpage.dart';
import 'package:foodie/widgets/triangle.dart';

class Foodquantity extends StatefulWidget {
  @override
  State<Foodquantity> createState() => _FoodquantityState();
}

class _FoodquantityState extends State<Foodquantity> {
  int index = 0;
  int wprice = 12;

  int dprice = 50;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 12),
          color: kbackground,
          width: double.maxFinite,
          height: 40,
          child: Stack(
            children: [
              Align(
                alignment: Alignment(-0.3, 0),
                child: Container(
                  height: double.maxFinite,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'units',
                        style: ksmalltext.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.4, 0),
                child: Container(
                  height: double.maxFinite,
                  width: 120,
                  decoration: BoxDecoration(
                      color: kprimarycolor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            index > 0 ? index-- : index = 0;
                            wprice = index * 12;
                          });
                        },
                        child: Text(
                          '-',
                          style: ksmalltext.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 35),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Text(
                          '$index',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            index < 20 ? index++ : index = 20;
                            wprice = index * 12;
                          });
                        },
                        child: Text(
                          '+',
                          style: ksmalltext.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 30),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 11),
        Column(
          children: [
            ClipPath(
              clipper: triangle(),
              child: Container(
                color: Colors.white,
                width: 30,
                height: 20,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              height: 111,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "\$",
                              style: ksmalltext.copyWith(
                                  fontSize: 12,
                                  color: kprimarycolor,
                                  fontWeight: FontWeight.bold,
                                  fontFeatures: [FontFeature.superscripts()]),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "$wprice",
                              style: ksmalltext.copyWith(
                                  fontSize: 33,
                                  color: kprimarycolor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ".$dprice",
                              style: ksmalltext.copyWith(
                                  fontSize: 24,
                                  color: kprimarycolor,
                                  fontWeight: FontWeight.bold,
                                  fontFeatures: [FontFeature.superscripts()]),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Total Price',
                        style: ksmalltext.copyWith(
                            color: Colors.grey, fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Maincartpage()));
                    },
                    child: Container(
                      height: 53,
                      width: 158,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kprimarycolor,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Place Order',
                              style: kbigtext.copyWith(
                                  fontSize: 15, color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              FontAwesomeIcons.cartShopping,
                              size: 15,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
