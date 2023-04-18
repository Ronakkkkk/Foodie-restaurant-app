import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:foodie/constants/Colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/Profile%20Screen/mainprofilescreem.dart';
import 'package:foodie/screens/cart%20screen/maincartpage.dart';
import 'package:foodie/screens/login_screen/main_intro_screen.dart';
import 'package:foodie/screens/menuscreen/mainmenuscreen.dart';
import 'package:foodie/screens/promoscreen/mainpromoscreen.dart';
import 'package:foodie/widgets/drawertitle.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class drawerinfo extends StatelessWidget {
  const drawerinfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 25, top: 135),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profilescreen()),
              );
            },
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Image(
                          image: AssetImage('assets/images/wink.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Hello,',
                      style: kcredtext.copyWith(
                          fontSize: 18,
                          color: kprimarycolor,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Ronak",
                      style: kbigtext.copyWith(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 514,
            child: ListView(
              itemExtent: 55,
              children: [
                drawertitles('Home', FontAwesomeIcons.house),
                drawertitles(
                  'My Cart',
                  FontAwesomeIcons.cartShopping,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Maincartpage()));
                  },
                ),
                drawertitles('Order History', FontAwesomeIcons.bowlFood),
                drawertitles(
                  'Enter Promo Code',
                  FontAwesomeIcons.code,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainpromoScreen()));
                  },
                ),
                drawertitles('Favourites', FontAwesomeIcons.star),
                drawertitles('Profile', FontAwesomeIcons.headSideVirus,
                    ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Profilescreen()),
                  );
                }),
                drawertitles(
                  'Logout',
                  FontAwesomeIcons.rightFromBracket,
                  ontap: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
