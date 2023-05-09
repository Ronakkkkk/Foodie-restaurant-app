import 'package:flutter/material.dart';

import 'package:foodie/constants/colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/promo_screen/widgets/promo_box.dart';
import 'package:foodie/widgets/custom_app_bar.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPromoScreen extends StatelessWidget {
  const MainPromoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            CustomAppBar(
              FontAwesomeIcons.angleLeft,
              rightIcon: FontAwesomeIcons.solidBell,
              iconColor: kIconColor,
              leftOnTap: () {
                Navigator.pop(context);
              },
            ),
            Container(
                padding: const EdgeInsets.only(top: 15, bottom: 15, right: 8),
                height: 330,
                width: 600,
                child: const Image(
                  image: AssetImage(
                    'assets/images/gift1.png',
                  ),
                  fit: BoxFit.contain,
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Have a Promo Code?',
              style:
                  kBigText.copyWith(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'You dont have any promo codes rightnow. Enter the promo code to redeem your offers!',
              textAlign: TextAlign.center,
              style: kSmallText.copyWith(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 90,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const PromoBox();
                    });
              },
              child: Container(
                height: 55,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kPromoColorAlt),
                child: Center(
                  child: Text(
                    'Enter Promo',
                    style: kSmallText.copyWith(
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
