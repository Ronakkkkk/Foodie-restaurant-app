// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/firebase/auth.dart';
import 'package:foodie/screens/home%20page/main_food_page%20.dart';
import 'package:foodie/screens/login_screen/loginscreen.dart';
import 'package:foodie/screens/login_screen/register.dart';
import 'package:foodie/screens/login_screen/registerinfo.dart';
import 'package:neopop/neopop.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class OtpPage extends StatelessWidget {
  final otpcontroller = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final String verifyid;
  OtpPage(this.verifyid);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 47,
      height: 47,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
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
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Let\'s get you started!',
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
                            'Enter your otp.',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.left,
                            style: kcredtextlight.copyWith(
                                color: const Color(0xff6B6B6B),
                                fontSize: 24,
                                fontWeight: FontWeight.w100),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Pinput(
                            controller: otpcontroller,
                            length: 6,
                            defaultPinTheme: defaultPinTheme,
                            focusedPinTheme: focusedPinTheme,
                            submittedPinTheme: submittedPinTheme,
                            pinputAutovalidateMode:
                                PinputAutovalidateMode.onSubmit,
                            showCursor: true,
                            onCompleted: (pin) => print(pin),
                          ),
                          SizedBox(
                            height: 35,
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
              padding: EdgeInsets.symmetric(horizontal: 33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NeoPopButton(
                    color: Colors.white,
                    onTapUp: () {},
                    onTapDown: () async {
                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verifyid,
                                smsCode: otpcontroller.text.trim());

                        // Sign the user in (or link) with the credential
                        await auth.signInWithCredential(credential);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => RegisterInfoScreen())));
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
                            "Verify Phone Number",
                            style: kcredtext.copyWith(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Use a different',
                        style: kcredtextlight.copyWith(
                            fontSize: 20, color: Color(0xff6B6B6B)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          'Phone Number?',
                          style: kcredtextlight.copyWith(
                              fontSize: 19, color: Colors.white),
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
