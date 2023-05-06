import 'package:flutter/material.dart';
import 'package:foodie/constants/texts.dart';

class WidgetIcon extends StatelessWidget {
  final Color color;
  final String text;
  final IconData iconData;
  final Function? onTap;
  const WidgetIcon(this.color, this.text, this.iconData, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null
          ? () {
              onTap!();
            }
          : null,
      child: Column(
        children: [
          Icon(
            iconData,
            size: 25,
            color: color,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            text,
            style: kSmallText.copyWith(fontSize: 15),
          )
        ],
      ),
    );
  }
}
