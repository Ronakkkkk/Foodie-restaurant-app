import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/cart_screen/quantity.dart';
import 'package:foodie/widgets/cloud_image_loader.dart';
import 'package:foodie/widgets/string_casing.dart';

class CartBox extends StatefulWidget {
  final List<QueryDocumentSnapshot> cartItems;

  const CartBox({
    super.key,
    required this.cartItems,
  });

  @override
  State<CartBox> createState() => _CartBoxState();
}

class _CartBoxState extends State<CartBox> {
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
            itemCount: widget.cartItems.length,
            itemBuilder: (
              context,
              index,
            ) {
              return _cartContent(index, widget.cartItems);
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
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
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
            data[index]['name'].toString().toTitleCase(),
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
          CartQuantity(
            intialquantity: data[index]['quantity'],
            onQuantityChanged: (newQuantity) {
              if (newQuantity > 0) {
                // Updates the 'quantity' field in the Firebase document
                data[index].reference.update({'quantity': newQuantity});
              } else {
                // Deletes the document if quantity is 0
                data[index].reference.delete();
                setState(() {
                  data.removeAt(index);
                });
              }
            },
          )
        ],
      ),
    );
  }
}
