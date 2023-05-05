import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/screens/cart_screen/widgets/bottom_row.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.grey,
        ),
        BottomRow('Subtotal', '144.49', 15, FontWeight.normal),
        BottomRow('Discount', '0', 15, FontWeight.normal),
        BottomRow('Delivery charge', '3.5', 15, FontWeight.normal),
        const SizedBox(
          height: 2,
        ),
        const Divider(
          color: kCartScreenColor,
        ),
        const SizedBox(
          height: 2,
        ),
        BottomRow('Total', '148.4', 22, FontWeight.bold),
        const SizedBox(
          height: 22,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          width: 200,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xffFEC302)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
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
