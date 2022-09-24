import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/Colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/cart%20screen/maincartpage.dart';
import 'package:foodie/widgets/Widgeticons.dart';

class Widgetcontainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      height: 220,
      width: 340,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Widgeticon(
                kprofilecolor,
                'Cart',
                FontAwesomeIcons.cartShopping,
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Maincartpage()));
                },
              ),
              Widgeticon(
                  Color(0xffF86BB3), 'Location', FontAwesomeIcons.locationDot),
              Widgeticon(kprofilecolor, 'Settings', FontAwesomeIcons.sliders)
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            color: Colors.grey[300],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Widgeticon(kprofilecolor, 'Notification', FontAwesomeIcons.bell),
              Widgeticon(kprofilecolor, 'FAQ', FontAwesomeIcons.comment),
              Widgeticon(Color(0xffF86BB3), 'Favourites', FontAwesomeIcons.star)
            ],
          )
        ],
      ),
    );
  }
}
