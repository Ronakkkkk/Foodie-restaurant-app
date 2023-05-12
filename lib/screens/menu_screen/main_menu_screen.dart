import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:foodie/constants/colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/cart_screen/main_cart_page.dart';
import 'package:foodie/screens/cart_screen/widgets/add_to_cart_logic.dart';
import 'package:foodie/screens/menu_screen/food_quantity.dart';
import 'package:foodie/widgets/cloud_image_loader.dart';

import 'package:foodie/widgets/my_app_bar.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/widgets/ingredients.dart';
import 'package:foodie/widgets/string_casing.dart';

class MenuScreen extends StatefulWidget {
  final String d_id;
  const MenuScreen(this.d_id, {super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int quantity = 1;
  late String userId;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      userId = user.uid;
    }
    return Scaffold(
      backgroundColor: kBackground,
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('food-items')
              .doc(widget.d_id)
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
                    data['name'].toString().toTitleCase(),
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
                    height: 20,
                  ),
                  Center(child: Ingi(data['ingredients'])),
                  Container(
                      padding: const EdgeInsets.all(8),
                      height: 200,
                      width: 250,
                      child: CloudImageLoader(data['image'])),
                  FoodPrice(
                    price: data['price'],
                    onplaceorder: () {
                      try {
                        CartService.addToCart(
                            image: data['image'],
                            name: data['name'],
                            price: data['price'],
                            quantity: 1,
                            userId: userId);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainCartPage()));
                      } catch (e) {
                        print(e);
                      }
                    },
                  )
                ],
              ),
            );
          }),
    );
  }
}
