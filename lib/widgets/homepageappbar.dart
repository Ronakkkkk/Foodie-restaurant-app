// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';
import 'package:foodie/constants/Colors.dart';

class Homepageappbar extends StatelessWidget {
  final IconData lefticon;
  final IconData righticon;
  final Function? rightontap;
  final Function? leftontap;
  final Color color;
  const Homepageappbar(this.lefticon, this.righticon,
      {this.rightontap, this.leftontap, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: Center(
                child: Icon(
                  lefticon,
                  color: color,
                  size: 17,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: rightontap != null
                ? () {
                    rightontap!();
                  }
                : null,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: Center(
                child: Icon(
                  righticon,
                  color: color,
                  size: 17,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
