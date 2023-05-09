import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget {
  final IconData leftIcon;
  final IconData rightIcon;
  final Function? rightOnTap;
  final Function? leftOnTap;
  final Color color;
  const HomePageAppBar(this.leftIcon, this.rightIcon,
      {super.key, this.rightOnTap, this.leftOnTap, required this.color});

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
                  leftIcon,
                  color: color,
                  size: 17,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: rightOnTap != null
                ? () {
                    rightOnTap!();
                  }
                : null,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: Center(
                child: Icon(
                  rightIcon,
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
