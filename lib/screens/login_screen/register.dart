import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/login_screen/login_screen.dart';
import 'package:foodie/screens/login_screen/otp_screen.dart';

import 'package:neopop/neopop.dart';

class RegisterScreen extends StatelessWidget {
  final pNumberController = TextEditingController();
  String countryCodeText = '+977';
  static String verify = '';

  RegisterScreen({super.key});

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
                            'You\'re you new here?',
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
                            'Welcome home foodie,\n Let\'s start eating!',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.left,
                            style: kCredTextLight.copyWith(
                                color: const Color(0xff6B6B6B),
                                fontSize: 24,
                                fontWeight: FontWeight.w100),
                          ),
                          const SizedBox(
                            height: 55,
                          ),
                          TextField(
                            controller: pNumberController,
                            style: kTextField,
                            keyboardType: TextInputType.phone,
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
                              hintText: 'Enter your phone number',
                              hintStyle: kHintText,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NeoPopButton(
                    color: Colors.white,
                    onTapUp: () {},
                    onTapDown: () async {
                      try {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber:
                              countryCodeText + pNumberController.text.trim(),
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => OtpPage(verificationId)),
                              ),
                            );
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      } catch (e) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Oops!"),
                                content: Text("$e"),
                                actions: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 180,
                                        width: 600,
                                        child: const Image(
                                          image: AssetImage(
                                              'assets/images/otp.png'),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 40),
                                        child: NeoPopButton(
                                          onTapUp: () => Navigator.pop(context),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Ok",
                                                  style: kCredText.copyWith(
                                                      fontSize: 15,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          color: Colors.black,
                                          parentColor: Colors.black,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              );
                            });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Send Code",
                            style: kCredText.copyWith(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
