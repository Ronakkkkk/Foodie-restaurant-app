import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/screens/cart_screen/widgets/bottom_row.dart';

class TotalPrice extends StatelessWidget {
  final List<QueryDocumentSnapshot> cartItems;
  const TotalPrice({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int subtotal = 0;
    for (var cartItem in cartItems) {
      int price = cartItem['price'];
      subtotal += price;
    }

    double discount = 0.0;
    double deliveryCharge = 50;
    double total = subtotal - discount + deliveryCharge;
    return Column(
      children: [
        const Divider(
          color: Colors.grey,
        ),
        BottomRow(
            'Subtotal', subtotal.toStringAsFixed(2), 15, FontWeight.normal),
        BottomRow(
            'Discount', discount.toStringAsFixed(2), 15, FontWeight.normal),
        BottomRow('Delivery charge', deliveryCharge.toStringAsFixed(2), 15,
            FontWeight.normal),
        const SizedBox(
          height: 2,
        ),
        const Divider(
          color: kCartScreenColor,
        ),
        const SizedBox(
          height: 2,
        ),
        BottomRow('Total', total.toStringAsFixed(2), 22, FontWeight.bold),
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
