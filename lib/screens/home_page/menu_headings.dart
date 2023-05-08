import 'package:flutter/material.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/constants/texts.dart';

class FoodList extends StatelessWidget {
  final Function ontap;
  final int selected;
  final PageController pageController;
  FoodList(
      {super.key,
      required this.selected,
      required this.ontap,
      required this.pageController});
  final List<String> list = [
    'Recommended',
    'MoMo',
    "popular",
    'thakali',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 25, left: 5),
        height: 75,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    ontap(index);
                    pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
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
            itemCount: list.length));
  }
}
