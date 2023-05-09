import 'package:flutter/material.dart';

import 'package:foodie/constants/texts.dart';
import 'package:foodie/firebase/auth.dart';
import 'package:foodie/screens/home_page/main_food_page.dart';
import 'package:foodie/screens/login_screen/login_screen.dart';

import 'package:neopop/neopop.dart';

// ignore: use_key_in_widget_constructors
class RegisterInfoScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black45,
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
                width: double.maxFinite,
                height: 110,
                child: const Image(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.cover)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    width: 180,
                    height: 180,
                    child: const Image(
                        image: AssetImage('assets/images/vrpotato.png'),
                        fit: BoxFit.cover)),
                const SizedBox(
                  height: 22,
                ),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Let\'s know you better.',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.left,
                            style: kCredText.copyWith(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // Text(
                          //   'Welcome home foodie,\n Let\'s start eating!',
                          //   textDirection: TextDirection.ltr,
                          //   textAlign: TextAlign.left,
                          //   style: kcredtextlight.copyWith(
                          //       color: const Color(0xff6B6B6B),
                          //       fontSize: 24,
                          //       fontWeight: FontWeight.w100),
                          // ),
                          _textField(passwordController, 'Full Name'),
                          _textField(passwordController, 'Age'),
                          _textField(passwordController, 'Email'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: kCredTextLight.copyWith(
                            fontSize: 20, color: const Color(0xff6B6B6B)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => LoginScreen()))),
                        child: Text(
                          'Login!',
                          style: kCredTextLight.copyWith(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  NeoPopButton(
                    color: Colors.white,
                    onTapUp: () {},
                    onTapDown: () async {
                      try {
                        await auth().createnwithEmailandpassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => FoodPage())));
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Register",
                            style: kCredText.copyWith(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _textField(TextEditingController controller, String hinttext) {
  return Column(
    children: [
      TextField(
        controller: controller,
        style: kTextField,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff6B6B6B), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff6B6B6B), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          hintText: hinttext,
          hintStyle: kHintText,
        ),
      ),
      const SizedBox(
        height: 5,
      )
    ],
  );
}
