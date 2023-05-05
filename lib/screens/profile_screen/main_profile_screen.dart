import 'package:flutter/material.dart';

import 'package:foodie/constants/colors.dart';
import 'package:foodie/screens/profile_screen/bottom_row.dart';
import 'package:foodie/screens/profile_screen/name_screen.dart';
import 'package:foodie/screens/profile_screen/widget_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackground,
        body: Column(
          children: [
            Namescreen(),
            const SizedBox(
              height: 20,
            ),
            WidgetContainer(),
            const SizedBox(
              height: 15,
            ),
            const BottomRow()
          ],
        ),
      ),
    );
  }
}
