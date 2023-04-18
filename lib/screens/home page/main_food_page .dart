// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/Colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/home%20page/Menu_headings.dart';
import 'package:foodie/screens/home%20page/deals_page.dart';
import 'package:foodie/screens/home%20page/menudrawer.dart';
import 'package:foodie/screens/menuscreen/mainmenuscreen.dart';
import 'package:foodie/widgets/homepageappbar.dart';

import 'foodmenu.dart';

// ignore: use_key_in_widget_constructors
class Foodpage extends StatefulWidget {
  @override
  State<Foodpage> createState() => _FoodpageState();
}

class _FoodpageState extends State<Foodpage> {
  var selected = 0;
  final pagecontroller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), bottomRight: Radius.circular(30)),
        child: Drawer(
          width: 250,
          backgroundColor: kbackground,
          child: drawerinfo(),
        ),
      ),
      backgroundColor: Color(0xffEEF0F8),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              height: 15,
            ),
            Homepageappbar(
              FontAwesomeIcons.bars,
              FontAwesomeIcons.magnifyingGlass,
              color: kiconcolor,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Popular Deals',
              style: kbigtext,
            ),
            Dealspage(),
            Foodlist(
                selected: selected,
                ontap: (int index) {
                  setState(() {
                    selected = index;
                  });
                }),
            GestureDetector(
              child: Foodmenu(selected, (int index) {
                setState(() {
                  selected = index;
                });
              }, pagecontroller),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuScreen()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
