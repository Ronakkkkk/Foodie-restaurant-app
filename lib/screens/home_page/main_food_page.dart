import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/home_page/menu_headings.dart';
import 'package:foodie/screens/home_page/deals_page.dart';
import 'package:foodie/screens/home_page/menu_drawer.dart';
import 'package:foodie/screens/menu_screen/main_menu_screen.dart';
import 'package:foodie/widgets/home_page_app_bar.dart';

import 'food_menu.dart';

// ignore: use_key_in_widget_constructors
class FoodPage extends StatefulWidget {
  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selected = 0;
  final pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), bottomRight: Radius.circular(30)),
        child: Drawer(
          width: 250,
          backgroundColor: kBackground,
          child: DrawerInfo(),
        ),
      ),
      backgroundColor: const Color(0xffEEF0F8),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: 15,
            ),
            const HomePageAppBar(
              FontAwesomeIcons.bars,
              FontAwesomeIcons.magnifyingGlass,
              color: kIconColor,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Popular Deals',
              style: kBigText,
            ),
            GestureDetector(onTap: () {}, child: DealsPage()),
            FoodList(
              selected: selected,
              ontap: (int index) {
                setState(() {
                  selected = index;
                });
                pagecontroller.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              pageController: pagecontroller,
            ),
            FoodMenu(selected, (int index) {
              setState(() {
                selected = index;
              });
            }, pagecontroller)
          ],
        ),
      ),
    );
  }
}
