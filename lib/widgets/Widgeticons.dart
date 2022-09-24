import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/texts.dart';

class Widgeticon extends StatelessWidget {
  final Color color;
  final String text;
  final IconData iconData;
  final Function? ontap;
  Widgeticon(this.color, this.text, this.iconData, {this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap != null
          ? () {
              ontap!();
            }
          : null,
      child: Column(
        children: [
          Icon(
            iconData,
            size: 25,
            color: color,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '$text',
            style: ksmalltext.copyWith(fontSize: 15),
          )
        ],
      ),
    );
  }
}
