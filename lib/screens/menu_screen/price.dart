import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:foodie/constants/colors.dart';
import 'package:foodie/screens/menu_screen/food_quantity.dart';

class PriceThingy extends StatelessWidget {
  const PriceThingy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(
          height: 15,
        ),
        Text(
          'Choose the quantity:',
          style: TextStyle(fontSize: 14, color: kIconColor),
        ),
        SizedBox(
          height: 15,
        ),
        FoodQuantity(),
      ],
    );
  }
}
