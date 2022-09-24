// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';
import 'package:foodie/constants/Colors.dart';

class Customappbar extends StatelessWidget {
  final IconData lefticon;
  final IconData? righticon;
  final Function? rightontap;
  final Function? leftontap;
  final Color iconcolor;

  const Customappbar(
    this.lefticon, {
    this.righticon,
    this.rightontap,
    this.leftontap,
    required this.iconcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: leftontap != null
                ? () {
                    leftontap!();
                  }
                : null,
            child: Center(
              child: Icon(
                lefticon,
                color: iconcolor,
                size: 25,
              ),
            ),
          ),
          GestureDetector(
            onTap: rightontap != null
                ? () {
                    rightontap!();
                  }
                : null,
            child: Center(
              child: Icon(
                righticon != null ? righticon : null,
                color: iconcolor,
                size: 25,
              ),
            ),
          )
        ],
      ),
    );
  }
}
