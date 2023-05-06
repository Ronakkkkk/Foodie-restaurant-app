import 'package:flutter/material.dart';

import 'package:foodie/constants/texts.dart';
import 'package:foodie/screens/login_screen/introscreenbrain.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LoginContent extends StatefulWidget {
  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  PageController pageController = PageController(viewportFraction: 1);
  var _currentPageIndex = 0;
  final List _loginList = loginbrain.loginbran;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        _currentPageIndex = pageController.page!.toInt();
      });
    });
  }

  @override
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
                  _getcontent(context, index, _loginList)),
              itemCount: 3,
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
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
            margin: index == 1 ? const EdgeInsets.only(left: 10) : null,
            width: 160,
            height: 160,
            child: Image(
              image: AssetImage(list[index]['image']),
              fit: BoxFit.contain,
            )),
        const SizedBox(
          height: 75,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                child: Text(
                  list[index]['head'],
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.start,
                  style: kCredTextLight.copyWith(
                      fontSize: 35, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: double.maxFinite,
                child: Text(
                  list[index]['leg'],
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.start,
                  style: kCredTextLight.copyWith(
                      fontSize: 20, color: const Color(0xff6B6B6B)),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
