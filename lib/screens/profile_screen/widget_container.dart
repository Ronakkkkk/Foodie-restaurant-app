import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/screens/cart_screen/main_cart_page.dart';
import 'package:foodie/widgets/widget_icons.dart';

class WidgetContainer extends StatelessWidget {
  const WidgetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: 220,
      width: 340,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WidgetIcon(
                kProfileColor,
                'Cart',
                FontAwesomeIcons.cartShopping,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MainCartPage()));
                },
              ),
              const WidgetIcon(
                  Color(0xffF86BB3), 'Location', FontAwesomeIcons.locationDot),
              const WidgetIcon(kProfileColor, 'Settings', FontAwesomeIcons.sliders)
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Divider(
            color: Colors.grey[300],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              WidgetIcon(kProfileColor, 'Notification', FontAwesomeIcons.bell),
              WidgetIcon(kProfileColor, 'FAQ', FontAwesomeIcons.comment),
              WidgetIcon(Color(0xffF86BB3), 'Favourites', FontAwesomeIcons.star)
            ],
          )
        ],
      ),
    );
  }
}
