import 'package:flutter/material.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/cart_screen/quantity.dart';

class CartBox extends StatelessWidget {
  const CartBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 378,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: ((context, index) => const SizedBox(
                  width: 20,
                )),
            itemCount: 5,
            itemBuilder: (context, index) {
              return _cartContent(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _cartContent(int index) {
    return Container(
      height: 350,
      width: 210,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            height: 250,
            width: 210,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xffDCDBDB)),
            child: const Image(image: AssetImage('assets/images/bowl.png')),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'American Salad With Seasoning',
            style: kSmallText.copyWith(
                fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                '\$',
                style: kSmallText.copyWith(color: Colors.white, fontSize: 10),
              ),
              const SizedBox(
                width: 4,
              ),
              Text('12.45',
                  style: kSmallText.copyWith(color: Colors.grey, fontSize: 16)),
            ],
          ),
          const CartQuantity()
        ],
      ),
    );
  }
}
