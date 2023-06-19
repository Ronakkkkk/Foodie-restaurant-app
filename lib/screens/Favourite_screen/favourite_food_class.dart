import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/screens/Favourite_screen/fav_ingi.dart';

import '../../constants/colors.dart';
import '../../constants/texts.dart';

class FoodTile extends StatefulWidget {
  @override
  State<FoodTile> createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          height: 600,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => _menutile(),
            separatorBuilder: (context, innerIndex) => const SizedBox(
              height: 25,
            ),
            itemCount: 4,
          ),
        ));
  }
}

Widget _menutile() {
  return Stack(
    children: [
      Container(
        height: 182,
        width: double.maxFinite,
        margin: const EdgeInsets.only(top: 0, right: 25, left: 25, bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Container(
          padding: EdgeInsets.only(top: 25, right: 20, left: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chicken MoMo',
                    style:
                        kBigText.copyWith(color: kPrimaryColor, fontSize: 23),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Nepali Delights',
                style: kSmallText.copyWith(
                    fontSize: 20, color: const Color(0xff747478)),
              ),
              Favingi(),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Row(children: [
                  Text(
                    "Rs.",
                    style: kSmallText.copyWith(
                        fontSize: 16,
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
      GestureDetector(
        onTap: () {},
        child: Positioned(
          top: 15,
          right: 45,
          child: Icon(
            FontAwesomeIcons.solidHeart,
            color: Colors.red,
          ),
        ),
      ),
      Positioned(
        right: 5,
        bottom: 0,
        child: Container(
          height: 150,
          width: 150,
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
  );
}
