import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/login_screen/Widgets/listviewbuilder_content.dart';
import 'package:foodie/screens/login_screen/loginscreen.dart';
import 'package:foodie/screens/login_screen/register.dart';
import 'package:neopop/neopop.dart';
import 'dart:math';
import 'package:foodie/constants/neopop.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Mainintroscreen extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xff0D0D0D),
            body: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.maxFinite,
                      height: 200,
                      child: Image(
                          image: AssetImage('assets/images/ng.png'),
                          fit: BoxFit.cover)),
                  Logincontent(),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 27, vertical: 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: NeoPopButton(
                            color: Colors.white,
                            buttonPosition: Position.fullBottom,
                            depth: kButtonDepth,
                            onTapUp: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => LoginScreen())));
                            },
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 15.0),
                                child: Text(
                                  "Login",
                                  style: kcredtext,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: NeoPopButton(
                            color: Color(0xFF0D0D0D),
                            bottomShadowColor: Color(0xff6B6B6B),
                            rightShadowColor: Color(0xff6B6B6B),
                            buttonPosition: Position.fullBottom,
                            depth: kButtonDepth,
                            onTapUp: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          RegisterScreen())));
                            },
                            border: Border.all(
                              color: Color(0xff6B6B6B),
                              width: 1,
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 15.0),
                                child: Text(
                                  "Register",
                                  style: kcredtext1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // NeoPopButton(
                    //   color: Colors.white,
                    //   onTapUp: () {},
                    //   onTapDown: () {},
                    //   child: Padding(
                    //     padding:
                    //         EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Text("Pay now"),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ),
                ],
              ),
            )));
  }
}
