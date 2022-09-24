import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/login_screen/introscreenbrain.dart';
import 'package:neopop/neopop.dart';
import 'dart:math';
import 'package:foodie/constants/neopop.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Logincontent extends StatefulWidget {
  @override
  State<Logincontent> createState() => _LogincontentState();
}

class _LogincontentState extends State<Logincontent> {
  PageController pageController = PageController(viewportFraction: 1);
  var _currentpgaeindex = 0;
  List _loginlist = loginbrain.loginbran;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        _currentpgaeindex = pageController.page!.toInt();
      });
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 392,
            child: PageView.builder(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) =>
                  _getcontent(context, index, _loginlist)),
              itemCount: 3,
            ),
          ),
          SizedBox(
            height: 11,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: ExpandingDotsEffect(
                    activeDotColor: Color(0xff6B6B6B),
                    radius: 0,
                    dotColor: Color(0xff6B6B6B),
                    dotHeight: 4,
                    dotWidth: 4,
                    expansionFactor: 9,
                    spacing: 4,
                    paintStyle: PaintingStyle.stroke)),
          )
        ],
      ),
    );
  }
}

Widget _getcontent(context, int index, List list) {
  return Container(
    height: 300,
    width: MediaQuery.of(context).size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: index == 1 ? EdgeInsets.only(left: 10) : null,
            width: 160,
            height: 160,
            child: Image(
              image: AssetImage(list[index]['image']),
              fit: BoxFit.contain,
            )),
        SizedBox(
          height: 75,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                child: Text(
                  list[index]['head'],
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.start,
                  style: kcredtextlight.copyWith(
                      fontSize: 35, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: double.maxFinite,
                child: Text(
                  list[index]['leg'],
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.start,
                  style: kcredtextlight.copyWith(
                      fontSize: 20, color: Color(0xff6B6B6B)),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
