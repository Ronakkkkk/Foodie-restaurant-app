import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/Colors.dart';
import 'package:foodie/constants/texts.dart';

class Bottomrow extends StatelessWidget {
  final String initialtext;
  final String price;
  final double fontsize;
  final FontWeight fontWeight;
  Bottomrow(this.initialtext, this.price, this.fontsize, this.fontWeight);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$initialtext',
          style: ksmalltext.copyWith(
              color: kcartscreencolor,
              fontSize: fontsize,
              fontWeight: fontWeight),
        ),
        Row(
          children: [
            Text(
              '\$',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(
              width: 4,
            ),
            Text('$price',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontsize,
                    fontWeight: fontWeight)),
          ],
        ),
      ],
    );
  }
}
