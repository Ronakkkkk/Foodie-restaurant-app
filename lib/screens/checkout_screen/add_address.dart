import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/screens/checkout_screen/map_screen.dart';
import 'package:foodie/widgets/custom_app_bar.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';

import '../../constants/texts.dart';
import '../../firebase/addressinfo.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final userNameController = TextEditingController();
  final addressTitleController = TextEditingController();
  final userOrganizationController = TextEditingController();
  final addressDetailController = TextEditingController();
  final userPhoneController = TextEditingController();
  final userAltPhoneController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  addressFirestoreService firestoreService = addressFirestoreService();

  Future<void> AddAddressScreen(BuildContext context) async {
    try {
      // Get the current user ID
      User? currentUser = _auth.currentUser;
      String? userId = currentUser?.uid;

      if (userId != null) {
        // Get the address information from the text fields
        String name = userNameController.text;
        String title = addressTitleController.text;
        String organization = userOrganizationController.text;
        String location = addressDetailController.text;
        String number = userPhoneController.text;
        String alnumber = userAltPhoneController.text;

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
              child: ElevatedButton(
                child: const Text("Open Map"),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MapScreen(),
                )),
              ),
            ),
            Container(
              padding: EdgeInsets.all(25),
              child: Column(children: [
                _textField(
                    addressTitleController, 'Address title; name, office', 1),
                _textField(userNameController, 'Name', 1),
                _textField(userOrganizationController, 'Organiation', 1),
                _textField(
                    addressDetailController, 'Detailed Address location', 4),
                _textField(userPhoneController, 'Number', 1),
                _textField(userAltPhoneController, 'Alternate number', 1),
                SizedBox(
                  height: 20,
                ),
                NeoPopButton(
                  color: Colors.white,
                  onTapUp: () {},
                  onTapDown: () async {
                    await AddAddressScreen(context);
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

Widget _textField(
    TextEditingController controller, String hinttext, int maxlines) {
  return Column(
    children: [
      TextField(
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
