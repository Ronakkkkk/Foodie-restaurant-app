import 'package:flutter/material.dart';

import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/login_screen/Widgets/listviewbuilder_content.dart';
import 'package:foodie/screens/login_screen/login_screen.dart';
import 'package:foodie/screens/login_screen/register.dart';
import 'package:neopop/neopop.dart';
import 'package:foodie/constants/neopop.dart';

class MainIntroScreen extends StatelessWidget {
  const MainIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0D0D0D),
        body: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: double.maxFinite,
                  height: 200,
                  child: const Image(
                      image: AssetImage('assets/images/ng.png'),
                      fit: BoxFit.cover)),
              LoginContent(),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 27, vertical: 15),
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
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 15.0),
                            child: Text(
                              "Login",
                              style: kCredText,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: NeoPopButton(
                        color: const Color(0xFF0D0D0D),
                        bottomShadowColor: const Color(0xff6B6B6B),
                        rightShadowColor: const Color(0xff6B6B6B),
                        buttonPosition: Position.fullBottom,
                        depth: kButtonDepth,
                        onTapUp: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => RegisterScreen())));
                        },
                        border: Border.all(
                          color: const Color(0xff6B6B6B),
                          width: 1,
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 15.0),
                            child: Text(
                              "Register",
                              style: kCredTextAlt,
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
        ),
      ),
    );
  }
}
