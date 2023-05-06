import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:foodie/constants/colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/cart_screen/main_cart_page.dart';
import 'package:foodie/widgets/triangle.dart';

class FoodQuantity extends StatefulWidget {
  const FoodQuantity({super.key});

  @override
  State<FoodQuantity> createState() => _FoodQuantityState();
}

class _FoodQuantityState extends State<FoodQuantity> {
  int index = 0;
  int wprice = 12;

  int dprice = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 12),
          color: kBackground,
          width: double.maxFinite,
          height: 40,
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(-0.3, 0),
                child: Container(
                  height: double.maxFinite,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'units',
                        style: kSmallText.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.4, 0),
                child: Container(
                  height: double.maxFinite,
                  width: 120,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
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
                          style: kSmallText.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 35),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Text(
                          '$index',
                          style: const TextStyle(
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
                          style: kSmallText.copyWith(
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
        const SizedBox(height: 11),
        Column(
          children: [
            ClipPath(
              clipper: Triangle(),
              child: Container(
                color: Colors.white,
                width: 30,
                height: 20,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
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
                              style: kSmallText.copyWith(
                                  fontSize: 12,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontFeatures: [
                                    const FontFeature.superscripts()
                                  ]),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              "$wprice",
                              style: kSmallText.copyWith(
                                  fontSize: 33,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ".$dprice",
                              style: kSmallText.copyWith(
                                  fontSize: 24,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontFeatures: [
                                    const FontFeature.superscripts()
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Total Price',
                        style: kSmallText.copyWith(
                            color: Colors.grey, fontSize: 12),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainCartPage()));
                    },
                    child: Container(
                      height: 53,
                      width: 158,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kPrimaryColor,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Place Order',
                              style: kBigText.copyWith(
                                  fontSize: 15, color: Colors.white),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
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
