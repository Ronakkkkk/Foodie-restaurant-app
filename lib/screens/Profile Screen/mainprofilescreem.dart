import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/Colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/Profile%20Screen/bottomrow.dart';
import 'package:foodie/screens/Profile%20Screen/namescreen.dart';
import 'package:foodie/screens/Profile%20Screen/widgetcontainer.dart';
import 'package:foodie/widgets/customappbar.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kbackground,
        body: Column(
          children: [
            Namescreen(),
            SizedBox(
              height: 20,
            ),
            Widgetcontainer(),
            SizedBox(
              height: 15,
            ),
            Botoomrow()
          ],
        ),
      ),
    );
  }
}
