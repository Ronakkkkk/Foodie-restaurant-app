import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodie/constants/Colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/menuscreen/price.dart';
import 'package:foodie/widgets/appbar.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/widgets/ingredients.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackground,
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            appbar(
              FontAwesomeIcons.angleLeft,
              color: kiconcolor,
              leftontap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Cheese Burger',
              style:
                  kbigtext.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text('American Delights',
                style: ksmalltext.copyWith(fontSize: 15, color: kiconcolor)),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 4.0,
                  children: List.generate(
                    4,
                    (index) => const Icon(
                      FontAwesomeIcons.solidStar,
                      color: kprimarycolor,
                      size: 12,
                    ),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  FontAwesomeIcons.star,
                  size: 12,
                )
              ],
            ),
            SizedBox(
              height: 18,
            ),
            ingi([
              Image.asset('assets/images/steak.png'),
              Image.asset('assets/images/cheese.png'),
              Image.asset(
                'assets/images/vegetable.png',
              )
            ], [
              'Steak',
              'Cheese',
              'Vegeis'
            ]),
            Container(
              padding: EdgeInsets.all(12),
              height: 200,
              width: 250,
              child: Image(
                image: AssetImage('assets/images/burger.png'),
                fit: BoxFit.fill,
              ),
            ),
            pricethingy()
          ],
        ),
      ),
    );
  }
}
