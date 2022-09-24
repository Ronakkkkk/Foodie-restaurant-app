import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/Colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/cart%20screen/cartboxes.dart';
import 'package:foodie/screens/cart%20screen/totalprice.dart';
import 'package:foodie/widgets/customappbar.dart';

class Maincartpage extends StatelessWidget {
  const Maincartpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Container(
          padding: EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Customappbar(
                FontAwesomeIcons.angleLeft,
                righticon: FontAwesomeIcons.squareCheck,
                iconcolor: kiconcolor,
                leftontap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'My Cart',
                style: kbigtext.copyWith(fontSize: 28, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Cartbox(),
              SizedBox(
                height: 8,
              ),
              Totalprice()
            ],
          ),
        ),
      ),
    );
  }
}
