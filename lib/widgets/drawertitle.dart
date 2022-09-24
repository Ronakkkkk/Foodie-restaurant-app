import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodie/constants/Colors.dart';

import '../constants/texts.dart';

class drawertitles extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function? ontap;
  drawertitles(this.title, this.iconData, {this.ontap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            size: 14,
            color: kiconcolor,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            '$title',
            style:
                kcredtext.copyWith(fontWeight: FontWeight.w600, fontSize: 17),
          )
        ],
      ),
      onTap: ontap != null
          ? () {
              ontap!();
            }
          : null,
    );
  }
}
