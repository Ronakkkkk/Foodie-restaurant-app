import 'package:flutter/material.dart';
import 'package:foodie/constants/colors.dart';

import '../constants/texts.dart';

class DrawerTitles extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function? onTap;
  const DrawerTitles(this.title, this.iconData, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            size: 14,
            color: kIconColor,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style:
                kCredText.copyWith(fontWeight: FontWeight.w600, fontSize: 17),
          )
        ],
      ),
      onTap: onTap != null
          ? () {
              onTap!();
            }
          : null,
    );
  }
}
