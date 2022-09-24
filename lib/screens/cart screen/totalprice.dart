import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/Colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/cart%20screen/widgets/bottomrows.dart';

class Totalprice extends StatelessWidget {
  const Totalprice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey,
        ),
        Bottomrow('Subtotal', '144.49', 15, FontWeight.normal),
        Bottomrow('Discount', '0', 15, FontWeight.normal),
        Bottomrow('Delivery charge', '3.5', 15, FontWeight.normal),
        SizedBox(
          height: 2,
        ),
        Divider(
          color: kcartscreencolor,
        ),
        SizedBox(
          height: 2,
        ),
        Bottomrow('Total', '148.4', 22, FontWeight.bold),
        SizedBox(
          height: 22,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18),
          width: 200,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffFEC302)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Proceed to Checkout'),
              Icon(
                FontAwesomeIcons.anglesRight,
                size: 15,
              )
            ],
          ),
        )
      ],
    );
  }
}
