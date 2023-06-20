import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/screens/Favourite_screen/widgets/Firebase.dart';

class MyAppBar extends StatefulWidget {
  final IconData leftIcon;
  final Function? rightOnTap;
  final Function? leftOnTap;
  final Color color;
  final Map<String, dynamic> userdata;
  const MyAppBar(this.leftIcon, this.userdata,
      {super.key, this.rightOnTap, this.leftOnTap, required this.color});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  IconData rightIcon = FontAwesomeIcons.heart;
  FavFirebaseService firebaseService = FavFirebaseService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: widget.leftOnTap != null
                ? () {
                    widget.leftOnTap!();
                  }
                : null,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: Icon(
                widget.leftIcon,
                color: widget.color,
                size: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              String? uid = await firebaseService.getCurrentUserId();
              firebaseService.addFav(widget.userdata, uid);
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: Icon(
                rightIcon,
                color: widget.color,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
