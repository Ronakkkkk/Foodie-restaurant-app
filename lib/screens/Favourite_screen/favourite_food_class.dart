import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/screens/Favourite_screen/fav_ingi.dart';
import 'package:foodie/screens/Favourite_screen/widgets/Firebase.dart';
import 'package:foodie/widgets/cloud_image_loader.dart';

import '../../constants/colors.dart';
import '../../constants/texts.dart';

class FoodTile extends StatefulWidget {
  final List<Map<String, dynamic>> favoritesData;

  final Function(int)? onTrashIconTap;

  const FoodTile(this.favoritesData, {this.onTrashIconTap});

  @override
  State<FoodTile> createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          height: 600,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) =>
                _menutile(index, widget.favoritesData),
            separatorBuilder: (context, innerIndex) => const SizedBox(
              height: 25,
            ),
            itemCount: widget.favoritesData.length,
          ),
        ));
  }
}

Widget _menutile(int index, List data) {
  return Stack(
    children: [
      Container(
        height: 182,
        width: double.maxFinite,
        margin: const EdgeInsets.only(top: 0, right: 25, left: 25, bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Container(
          padding: EdgeInsets.only(top: 25, right: 20, left: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data[index]['name'],
                        style: kBigText.copyWith(
                            color: kPrimaryColor, fontSize: 23),
                      ),
                      GestureDetector(
                        onTap: () async {
                          String? uid =
                              await FavFirebaseService().getCurrentUserId();
                          String documentId = data[index].id;
                          if (uid != null) {
                            await FavFirebaseService()
                                .deleteFav(uid, documentId);
                          }
                        },
                        child: Icon(
                          FontAwesomeIcons.trash,
                          size: 20,
                          color: kIconColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                data[index]['cuisine'],
                style: kSmallText.copyWith(
                    fontSize: 20, color: const Color(0xff747478)),
              ),
              Favingi(data[index]['ingredients']),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Row(children: [
                  Text(
                    "Rs.",
                    style: kSmallText.copyWith(
                        fontSize: 16,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontFeatures: [const FontFeature.superscripts()]),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    data[index]['price'],
                    style: kSmallText.copyWith(
                        fontSize: 20,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        right: 5,
        bottom: -1,
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Container(
              padding: EdgeInsets.all(10),
              child: CloudImageLoader(data[index]['image'])),
        ),
      ),
    ],
  );
}
