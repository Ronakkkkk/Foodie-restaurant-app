import 'package:flutter/material.dart';

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
            height: 190,
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
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chicken MoMo',
                    style: kBigText.copyWith(color: kIconColor, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 0,
            child: Container(
              height: 140,
              width: 140,
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
