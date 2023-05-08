import 'package:flutter/material.dart';

import 'package:foodie/constants/texts.dart';
import 'package:foodie/firebase/auth.dart';
import 'package:foodie/screens/home_page/main_food_page.dart';
import 'package:foodie/screens/login_screen/register.dart';

import 'package:neopop/neopop.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatelessWidget {
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
                    fit: BoxFit.contain)),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    width: 160,
                    height: 160,
                    child: const Image(
                        image: AssetImage('assets/images/vrburger.png'),
                        fit: BoxFit.contain)),
                const SizedBox(
                  height: 42,
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
                            'Let\'s sign you in.',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.left,
                            style: kCredText.copyWith(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Welcome back.\nYouv\'e been missed!',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.left,
                            style: kCredTextLight.copyWith(
                                color: const Color(0xff6B6B6B),
                                fontSize: 24,
                                fontWeight: FontWeight.w100),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextField(
                            controller: emailController,
                            style: kTextField,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff6B6B6B), width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff6B6B6B), width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              hintText: 'Phone, email or username',
                              hintStyle: kHintText,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: passwordController,
                            style: kTextField,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff6B6B6B), width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff6B6B6B), width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              hintText: 'Password',
                              hintStyle: kHintText,
                            ),
                          )
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
                        'Don\'t have an account?',
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
                                builder: ((context) => RegisterScreen()))),
                        child: Text(
                          'Register',
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
                        await auth().signInwithEmailandpassword(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Login",
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
