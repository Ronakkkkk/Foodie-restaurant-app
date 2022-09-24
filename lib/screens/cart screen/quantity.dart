import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/constants/Colors.dart';
import 'package:foodie/constants/texts.dart';

class Cartquantity extends StatefulWidget {
  @override
  State<Cartquantity> createState() => _CartquantityState();
}

class _CartquantityState extends State<Cartquantity> {
  int index = 1;
  int wprice = 12;

  int dprice = 50;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      width: 100,
      height: 40,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0.4, 0),
            child: Container(
              height: double.maxFinite,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index--;
                      });
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xff524F4F))),
                      child: Icon(
                        FontAwesomeIcons.minus,
                        color: Color(0xff524F4F),
                        size: 14,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Text(
                      '$index',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index++;
                      });
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xff524F4F))),
                      child: Icon(
                        FontAwesomeIcons.plus,
                        color: Color(0xff524F4F),
                        size: 14,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
