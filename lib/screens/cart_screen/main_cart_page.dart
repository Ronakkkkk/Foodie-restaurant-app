import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/cart_screen/cart_box.dart';
import 'package:foodie/screens/cart_screen/total_price.dart';
import 'package:foodie/widgets/custom_app_bar.dart';

class MainCartPage extends StatefulWidget {
  const MainCartPage({Key? key}) : super(key: key);

  @override
  State<MainCartPage> createState() => _MainCartPageState();
}

class _MainCartPageState extends State<MainCartPage> {
  late String userId;
  late CollectionReference cartCollection;
  late List<QueryDocumentSnapshot> cartItems = [];
  int cartQuantity = 1;

  @override
  void initState() {
    super.initState();
    fetchCartItems();
  }

  Future<void> fetchCartItems() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      String userId = user.uid;

      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('cart')
          .get();

      setState(() {
        cartItems = snapshot.docs; // Store the documents in the list
      });
    }
  }

  void handleCartQuantityChanged(int newQuantity) {
    setState(() {
      cartQuantity = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Container(
          padding:
              const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                FontAwesomeIcons.angleLeft,
                rightIcon: FontAwesomeIcons.squareCheck,
                iconColor: kIconColor,
                leftOnTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'My Cart',
                style: kBigText.copyWith(fontSize: 28, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              CartBox(
                cartItems: cartItems,
              ),
              const SizedBox(
                height: 8,
              ),
              TotalPrice(
                cartItems: cartItems,
              )
            ],
          ),
        ),
      ),
    );
  }
}
