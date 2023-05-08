import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:foodie/constants/colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/menu_screen/food_quantity.dart';

import 'package:foodie/widgets/my_app_bar.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/widgets/ingredients.dart';

class MenuScreen extends StatelessWidget {
  final String d_id;
  const MenuScreen(this.d_id);

  // Future<void> fetchMenuData() async {
  //   DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
  //       .collection("food-items")
  //       .doc(d_id)
  //       .get();
  //   log(documentSnapshot.data().toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('food-items')
              .doc(d_id)
              .snapshots(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.hasData) {
              return const Text('No data available');
            }
            Map<String, dynamic> data =
                snapshot.data?.data() as Map<String, dynamic>;

            int rating = data['rating'];

            return Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  MyAppBar(
                    FontAwesomeIcons.angleLeft,
                    color: kIconColor,
                    leftOnTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    data['name'],
                    style: kBigText.copyWith(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(data['cuisine'],
                      style:
                          kSmallText.copyWith(fontSize: 15, color: kIconColor)),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(
                        spacing: 4.0,
                        children: List.generate(
                          rating,
                          (index) => const Icon(
                            FontAwesomeIcons.solidStar,
                            color: kPrimaryColor,
                            size: 12,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Wrap(
                        spacing: 4.0,
                        children: List.generate(
                          5 - rating,
                          (index) => const Icon(
                            FontAwesomeIcons.star,
                            color: kPrimaryColor,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Ingi(data['ingredients']),
                  Container(
                    padding: const EdgeInsets.all(12),
                    height: 200,
                    width: 250,
                    child: const Image(
                      image: AssetImage('assets/images/burger.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  FoodPrice(price: data['price'])
                ],
              ),
            );
          }),
    );
  }
}
