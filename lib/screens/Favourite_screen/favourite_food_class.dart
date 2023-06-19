import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodie/screens/Favourite_screen/fav_ingi.dart';

import '../../constants/colors.dart';
import '../../constants/texts.dart';

class FoodTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Stack(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            margin:
                const EdgeInsets.only(top: 0, right: 25, left: 25, bottom: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              // image: DecorationImage(
              //     image: AssetImage('assets/images/Capture.PNG'),
              //     fit: BoxFit.cover),
            ),
            child: Container(
              padding:
                  EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chicken MoMo',
                    style:
                        kBigText.copyWith(color: kPrimaryColor, fontSize: 25),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Nepali Delights',
                    style: kSmallText.copyWith(
                        fontSize: 20, color: const Color(0xff747478)),
                  ),
                  const SizedBox(height: 8),
                  Favingi(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(children: [
                      Text(
                        "Rs.",
                        style: kSmallText.copyWith(
                            fontSize: 15,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontFeatures: [const FontFeature.superscripts()]),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '200',
                        style: kSmallText.copyWith(
                            fontSize: 20,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 0,
            child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Image(
                    image: AssetImage("assets/images/veg-momo.png"),
                    fit: BoxFit.contain,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
