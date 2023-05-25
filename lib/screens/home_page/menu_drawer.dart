import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:foodie/constants/colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/firebase/auth.dart';
import 'package:foodie/screens/login_screen/main_intro_screen.dart';
import 'package:foodie/screens/profile_screen/main_profile_screen.dart';
import 'package:foodie/screens/cart_screen/main_cart_page.dart';
import 'package:foodie/screens/promo_screen/main_promo_screen.dart';
import 'package:foodie/widgets/drawer_title.dart';

class DrawerInfo extends StatelessWidget {
  const DrawerInfo({Key? key}) : super(key: key);

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
                MaterialPageRoute(builder: (context) => ProfileScreen()),
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
                      style: kCredText.copyWith(
                          fontSize: 18,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Ronak",
                      style: kBigText.copyWith(
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
                const DrawerTitles('Home', FontAwesomeIcons.house),
                DrawerTitles(
                  'My Cart',
                  FontAwesomeIcons.cartShopping,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainCartPage()));
                  },
                ),
                const DrawerTitles('Order History', FontAwesomeIcons.bowlFood),
                DrawerTitles(
                  'Enter Promo Code',
                  FontAwesomeIcons.code,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainPromoScreen()));
                  },
                ),
                const DrawerTitles('Favourites', FontAwesomeIcons.star),
                DrawerTitles('Profile', FontAwesomeIcons.headSideVirus,
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                }),
                DrawerTitles(
                  'Logout',
                  FontAwesomeIcons.rightFromBracket,
                  onTap: () {
                    try {
                      auth().signout();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => MainIntroScreen())));
                    } catch (e) {
                      return e;
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
