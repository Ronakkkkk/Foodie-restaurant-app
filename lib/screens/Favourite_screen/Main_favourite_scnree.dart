import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/screens/Favourite_screen/favourite_food_class.dart';
import 'package:foodie/screens/Favourite_screen/widgets/Firebase.dart';
import 'package:foodie/widgets/custom_app_bar.dart';

import '../../constants/texts.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<Map<String, dynamic>> favoritesData = [];

  @override
  void initState() {
    super.initState();
    fetchFavorites();
  }

  Future<void> fetchFavorites() async {
    FavFirebaseService firebaseService = FavFirebaseService();
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    String? uid = await firebaseService.getCurrentUserId();
    final DocumentSnapshot userSnapshot = await usersCollection.doc(uid).get();

    final QuerySnapshot favoritesSnapshot =
        await userSnapshot.reference.collection('favourites').get();

    final List<Map<String, dynamic>> data = favoritesSnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    setState(() {
      favoritesData = data;
    });
  }

  Future<void> deleteFavorite(DocumentSnapshot favorite) async {
    final CollectionReference favoritesCollection = favorite.reference.parent;

    await favoritesCollection.doc(favorite.id).delete();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackground,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      CustomAppBar(
                        Icons.arrow_back_ios_outlined,
                        iconColor: kIconColor,
                        leftOnTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Favourites',
                        style: kBigText.copyWith(
                            fontSize: 28, color: kPrimaryColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SearchBar(
                          hintText: 'Search',
                          leading: Icon(Icons.search_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FoodTile(favoritesData)
            ],
          ),
        ),
      ),
    ));
  }
}
