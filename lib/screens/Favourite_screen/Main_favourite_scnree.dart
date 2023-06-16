import 'package:flutter/material.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/screens/Favourite_screen/favourite_food_class.dart';
import 'package:foodie/widgets/custom_app_bar.dart';

import '../../constants/texts.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackground,
      body: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ,
              ),
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
                style: kBigText.copyWith(fontSize: 28, color: kPrimaryColor),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SearchBar(
                  hintText: 'Search',
                  leading: Icon(Icons.search_outlined),
                ),
              ),
              FoodTile()
            ],
          ),
        ),
      ),
    ));
  }
}
