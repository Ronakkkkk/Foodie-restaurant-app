import 'package:flutter/material.dart';

import 'package:foodie/constants/colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/menu_screen/price.dart';
import 'package:foodie/widgets/my_app_bar.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/widgets/ingredients.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            MyAppBar(
              FontAwesomeIcons.angleLeft,
              color: kIconColor,
              leftOnTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Cheese Burger',
              style:
                  kBigText.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Text('American Delights',
                style: kSmallText.copyWith(fontSize: 15, color: kIconColor)),
            const SizedBox(
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
                      color: kPrimaryColor,
                      size: 12,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Icon(
                  FontAwesomeIcons.star,
                  size: 12,
                )
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Ingi([
              Image.asset('assets/images/steak.png'),
              Image.asset('assets/images/cheese.png'),
              Image.asset(
                'assets/images/vegetable.png',
              )
            ], const [
              'Steak',
              'Cheese',
              'Veggies'
            ]),
            Container(
              padding: const EdgeInsets.all(12),
              height: 200,
              width: 250,
              child: const Image(
                image: AssetImage('assets/images/burger.png'),
                fit: BoxFit.fill,
              ),
            ),
            const PriceThingy()
          ],
        ),
      ),
    );
  }
}
