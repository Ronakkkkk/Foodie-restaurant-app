// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:foodie/constants/Colors.dart';
import 'package:foodie/constants/texts.dart';

class Foodlist extends StatelessWidget {
  final Function ontap;
  final int selected;
  Foodlist({required this.selected, required this.ontap});
  final List<String> list = [
    'Recommended',
    'newest',
    "thakali",
    'MoMo',
    'Desert'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 25, left: 5),
        height: 75,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () => ontap(index),
                  child: Text(
                    list[index],
                    style: ksmalltext.copyWith(
                        color: selected == index ? kprimarycolor : kiconcolor,
                        fontSize: 22,
                        fontWeight: selected == index ? FontWeight.w900 : null),
                  ),
                ),
            separatorBuilder: (_, index) => const SizedBox(
                  width: 20,
                ),
            itemCount: 5));
  }
}
