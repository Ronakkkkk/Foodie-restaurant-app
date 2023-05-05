import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:foodie/constants/texts.dart';

class BottomRow extends StatelessWidget {
  const BottomRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 89,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 21,
                backgroundImage: AssetImage('assets/images/wink.png'),
              ),
              const SizedBox(
                width: 18,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ronak R. Rauniyar",
                    style: kSmallText.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '20 July',
                    style: kSmallText.copyWith(fontSize: 10),
                    textAlign: TextAlign.left,
                  )
                ],
              )
            ],
          ),
          const CircleAvatar(
            radius: 23,
            backgroundColor: Color(0xffF86BB3),
            child: Icon(
              FontAwesomeIcons.rightFromBracket,
              color: Colors.white,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
