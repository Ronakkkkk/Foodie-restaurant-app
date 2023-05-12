import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/cart_screen/quantity.dart';
import 'package:foodie/widgets/cloud_image_loader.dart';

class CartBox extends StatelessWidget {
  final List<QueryDocumentSnapshot> cartItems;
  CartBox({Key? key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 378,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: ((
              context,
              index,
            ) =>
                const SizedBox(
                  width: 20,
                )),
            itemCount: cartItems.length,
            itemBuilder: (
              context,
              index,
            ) {
              return _cartContent(index, cartItems);
            },
          ),
        ),
      ],
    );
  }

  Widget _cartContent(int index, List data) {
    return Container(
      height: 350,
      width: 210,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 250,
            width: 210,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xffDCDBDB)),
            child: CloudImageLoader(data[index]['image']),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            data[index]['name'],
            style: kSmallText.copyWith(
                fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                'Rs.',
                style: kSmallText.copyWith(color: Colors.white, fontSize: 10),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(data[index]['price'].toString(),
                  style: kSmallText.copyWith(color: Colors.grey, fontSize: 16)),
            ],
          ),
          const CartQuantity()
        ],
      ),
    );
  }
}
