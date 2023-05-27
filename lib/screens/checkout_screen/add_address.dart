import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/widgets/custom_app_bar.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';

import '../../constants/texts.dart';
import '../../firebase/addressinfo.dart';

class Addaddress extends StatelessWidget {
  final namecontroller = TextEditingController();
  final addtitlecontroller = TextEditingController();
  final orgcontroller = TextEditingController();
  final detailscontroller = TextEditingController();
  final numbercontroller = TextEditingController();
  final alnumbercontroller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  addressFirestoreService firestoreService = addressFirestoreService();

  Future<void> addAddress(BuildContext context) async {
    try {
      // Get the current user ID
      User? currentUser = _auth.currentUser;
      String? userId = currentUser?.uid;

      if (userId != null) {
        // Get the address information from the text fields
        String name = namecontroller.text;
        String title = addtitlecontroller.text;
        String organization = orgcontroller.text;
        String location = detailscontroller.text;
        String number = numbercontroller.text;
        String alnumber = alnumbercontroller.text;

        // Add the user information to Firestore
        await firestoreService.addAddress(
            userId, title, name, organization, location, number, alnumber);

        // Navigate to the home page
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(25),
              child: CustomAppBar(
                FontAwesomeIcons.angleLeft,
                iconColor: kIconColor,
                leftOnTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 230,
              width: double.infinity,
              color: Colors.yellow,
            ),
            Container(
              padding: EdgeInsets.all(25),
              child: Column(children: [
                _textField(addtitlecontroller, 'Address title; name, office', 1,
                    TextInputType.text),
                _textField(namecontroller, 'Name', 1, TextInputType.name),
                _textField(orgcontroller, 'Organiation', 1, TextInputType.text),
                _textField(detailscontroller, 'Detailed Address location', 4,
                    TextInputType.text),
                _textField(numbercontroller, 'Number', 1, TextInputType.phone),
                _textField(alnumbercontroller, 'Alternate number', 1,
                    TextInputType.phone),
                SizedBox(
                  height: 20,
                ),
                NeoPopButton(
                  color: Colors.white,
                  onTapUp: () {},
                  onTapDown: () async {
                    await addAddress(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add address",
                          style: kCredText.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    ));
  }
}

Widget _textField(TextEditingController controller, String hinttext,
    int maxlines, TextInputType type) {
  return Column(
    children: [
      TextField(
        keyboardType: type,
        controller: controller,
        maxLines: maxlines,
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
        height: 15,
      )
    ],
  );
}
