import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodie/constants/Colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/menuscreen/foodquanitty.dart';

class pricethingy extends StatelessWidget {
  const pricethingy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 15,
        ),
        Text(
          'Choose the quantity:',
          style: TextStyle(fontSize: 14, color: kiconcolor),
        ),
        SizedBox(
          height: 15,
        ),
        Foodquantity(),
      ],
    );
  }
}
