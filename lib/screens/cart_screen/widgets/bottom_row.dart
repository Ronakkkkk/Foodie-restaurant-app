import 'package:flutter/material.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/constants/texts.dart';

class BottomRow extends StatelessWidget {
  final String initialText;
  final String price;
  final double fontSize;
  final FontWeight fontWeight;

  const BottomRow(this.initialText, this.price, this.fontSize, this.fontWeight,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          initialText,
          style: kSmallText.copyWith(
              color: kCartScreenColor,
              fontSize: fontSize,
              fontWeight: fontWeight),
        ),
        Row(
          children: [
            const Text(
              'Rs.',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              price,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: fontWeight),
            ),
          ],
        ),
      ],
    );
  }
}
