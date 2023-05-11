// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';
import 'package:foodie/constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  final IconData leftIcon;
  final IconData? rightIcon;
  final Function? rightOnTap;
  final Function? leftOnTap;
  final Color iconColor;

  const CustomAppBar(
    this.leftIcon, {
    this.rightIcon,
    this.rightOnTap,
    this.leftOnTap,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: leftOnTap != null
                ? () {
                    leftOnTap!();
                  }
                : null,
            child: Center(
              child: Icon(
                leftIcon,
                color: iconColor,
                size: 25,
              ),
            ),
          ),
          GestureDetector(
            onTap: rightOnTap != null
                ? () {
                    rightOnTap!();
                  }
                : null,
            child: Center(
              child: Icon(
                rightIcon,
                color: iconColor,
                size: 25,
              ),
            ),
          )
        ],
      ),
    );
  }
}
