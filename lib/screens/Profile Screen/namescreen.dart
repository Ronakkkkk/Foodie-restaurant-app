import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/Colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/widgets/customappbar.dart';

class Namescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 408,
      decoration: BoxDecoration(
        color: kprofilecolor,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 318,
                padding: EdgeInsets.all(20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(35),
                      bottomLeft: Radius.circular(35)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 23,
                    ),
                    Customappbar(
                      FontAwesomeIcons.angleLeft,
                      righticon: FontAwesomeIcons.barsStaggered,
                      iconcolor: kprimarycolor,
                      leftontap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CircleAvatar(
                      radius: 58,
                      backgroundImage: AssetImage('assets/images/wink.png'),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Ronak R. Rauniyar",
                      style: ksmalltext.copyWith(
                          fontSize: 26, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Kathmandu, NP',
                      style: ksmalltext.copyWith(fontSize: 15),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 80,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '47',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Orders Fulfilled',
                      style: ksmalltext.copyWith(
                          fontSize: 12, color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '4.5',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          FontAwesomeIcons.solidStar,
                          size: 18,
                          color: Colors.white,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Rating',
                      style: ksmalltext.copyWith(
                          fontSize: 12, color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '4120',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Spending',
                      style: ksmalltext.copyWith(
                          fontSize: 12, color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
