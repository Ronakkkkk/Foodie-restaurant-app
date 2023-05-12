import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartQuantity extends StatefulWidget {
  const CartQuantity({
    super.key,
  });

  @override
  State<CartQuantity> createState() => _CartQuantityState();
}

class _CartQuantityState extends State<CartQuantity> {
  int index = 1;
  int wPrice = 12;
  int dPrice = 50;

  void _decrement() {
    setState(() {
      index--;
    });
  }

  void _increment() {
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      width: 100,
      height: 40,
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0.4, 0),
            child: Container(
              height: double.maxFinite,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _decrement,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xff524F4F))),
                      child: const Icon(
                        FontAwesomeIcons.minus,
                        color: Color(0xff524F4F),
                        size: 14,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Text(
                      '$index',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  GestureDetector(
                    onTap: _increment,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xff524F4F))),
                      child: const Icon(
                        FontAwesomeIcons.plus,
                        color: Color(0xff524F4F),
                        size: 14,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
