// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/firebase/auth.dart';
import 'package:foodie/main.dart';
import 'package:foodie/screens/home%20page/main_food_page%20.dart';
import 'package:foodie/screens/login_screen/loginscreen.dart';
import 'package:foodie/screens/login_screen/otpscreen.dart';
import 'package:foodie/screens/login_screen/register.dart';
import 'package:neopop/neopop.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class RegisterScreen extends StatelessWidget {
  final pnumbercontroller = TextEditingController();
  String countrycode_text = '+977';
  static String verify = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black45,
        body: Column(
          children: [
            SizedBox(
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
                    padding: EdgeInsets.only(bottom: 10),
                    width: 180,
                    height: 180,
                    child: Image(
                        image: AssetImage('assets/images/vrpotato.png'),
                        fit: BoxFit.cover)),
                SizedBox(
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
                            style: kcredtext.copyWith(
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
                            style: kcredtextlight.copyWith(
                                color: const Color(0xff6B6B6B),
                                fontSize: 24,
                                fontWeight: FontWeight.w100),
                          ),
                          const SizedBox(
                            height: 55,
                          ),
                          TextField(
                            controller: pnumbercontroller,
                            style: ktextfield,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
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
                              hintText: 'Enter phone number',
                              hintStyle: khinttext,
                            ),
                          ),
                          SizedBox(
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
              padding: EdgeInsets.symmetric(horizontal: 30),
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
                              '${countrycode_text + pnumbercontroller.text.trim()}',
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        OtpPage(verificationId))));
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      } catch (e) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Oops!"),
                                content: Text("$e"),
                                actions: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: 180,
                                          width: 600,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/otp.png'),
                                            fit: BoxFit.contain,
                                          )),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 40),
                                        child: NeoPopButton(
                                          onTapUp: () => Navigator.pop(context),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Ok",
                                                  style: kcredtext.copyWith(
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Send Code",
                            style: kcredtext.copyWith(fontSize: 15),
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
                        style: kcredtextlight.copyWith(
                            fontSize: 20, color: Color(0xff6B6B6B)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => LoginScreen()))),
                        child: Text(
                          'Login!',
                          style: kcredtextlight.copyWith(
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
