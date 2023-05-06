import 'package:flutter/material.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/constants/texts.dart';

class FoodList extends StatelessWidget {
  final Function ontap;
  final int selected;
  FoodList({super.key, required this.selected, required this.ontap});
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
                    style: kSmallText.copyWith(
                        color: selected == index ? kPrimaryColor : kIconColor,
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
