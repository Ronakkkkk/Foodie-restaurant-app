import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/Colors.dart';
import 'package:foodie/constants/texts.dart';

import 'package:foodie/screens/promoscreen/widgets/promobox.dart';
import 'package:foodie/widgets/customappbar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainpromoScreen extends StatelessWidget {
  const MainpromoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Customappbar(
              FontAwesomeIcons.angleLeft,
              righticon: FontAwesomeIcons.solidBell,
              iconcolor: kiconcolor,
              leftontap: () {
                Navigator.pop(context);
              },
            ),
            Container(
                padding: EdgeInsets.only(top: 15, bottom: 15, right: 8),
                height: 330,
                width: 600,
                child: Image(
                  image: AssetImage(
                    'assets/images/gift1.png',
                  ),
                  fit: BoxFit.contain,
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              'Have a Promo Code?',
              style:
                  kbigtext.copyWith(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'You dont have any promo codes rightnow. Enter the promo code to redeem your offers!',
              textAlign: TextAlign.center,
              style: ksmalltext.copyWith(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 90,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return PromoBox();
                    });
              },
              child: Container(
                height: 55,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: k1promocolor),
                child: Center(
                  child: Text(
                    'Enter Promo',
                    style: ksmalltext.copyWith(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
