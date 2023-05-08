import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/cart_screen/cart_box.dart';
import 'package:foodie/screens/cart_screen/total_price.dart';
import 'package:foodie/widgets/custom_app_bar.dart';

class MainCartPage extends StatelessWidget {
  const MainCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Container(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                FontAwesomeIcons.angleLeft,
                rightIcon: FontAwesomeIcons.squareCheck,
                iconColor: kIconColor,
                leftOnTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'My Cart',
                style: kBigText.copyWith(fontSize: 28, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              const CartBox(),
              const SizedBox(
                height: 8,
              ),
              const TotalPrice()
            ],
          ),
        ),
      ),
    );
  }
}
