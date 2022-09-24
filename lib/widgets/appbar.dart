import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/Colors.dart';

class appbar extends StatefulWidget {
  final IconData lefticon;

  final Function? rightontap;
  final Function? leftontap;
  final Color color;
  const appbar(this.lefticon,
      {this.rightontap, this.leftontap, required this.color});

  @override
  State<appbar> createState() => _appbarState();
}

class _appbarState extends State<appbar> {
  IconData righticon = FontAwesomeIcons.heart;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: widget.leftontap != null
                ? () {
                    widget.leftontap!();
                  }
                : null,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: Icon(
                widget.lefticon,
                color: widget.color,
                size: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                righticon = righticon == FontAwesomeIcons.heart
                    ? FontAwesomeIcons.solidHeart
                    : FontAwesomeIcons.heart;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: Icon(
                righticon,
                color: widget.color,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
