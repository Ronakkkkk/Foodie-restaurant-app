// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodie/constants/Colors.dart';
import 'package:foodie/constants/texts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Dealspage extends StatefulWidget {
  const Dealspage({Key? key}) : super(key: key);

  @override
  State<Dealspage> createState() => _DealspageState();
}

class _DealspageState extends State<Dealspage> {
  PageController pageController = PageController(viewportFraction: 1);
  var _currentpgaeindex = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentpgaeindex = pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, index) {
              return _buildpagecontent(index);
            },
          ),
        ),
        SizedBox(
          height: 4,
        ),
        SmoothPageIndicator(
            controller: pageController,
            count: 5,
            effect: ExpandingDotsEffect(
                activeDotColor: kprimarycolor,
                radius: 0,
                dotColor: Color(0xff6B6B6B),
                dotHeight: 5,
                dotWidth: 5,
                expansionFactor: 9,
                spacing: 5,
                paintStyle: PaintingStyle.stroke)),
      ],
    );
  }

  Widget _buildpagecontent(int index) {
    return Stack(children: [
      Container(
        height: 200,
        margin: const EdgeInsets.only(top: 25, right: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kprimarycolor,
          // image: DecorationImage(
          //     image: AssetImage('assets/images/Capture.PNG'),
          //     fit: BoxFit.cover),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 130,
          margin: const EdgeInsets.only(left: 25, right: 30, bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Container(
            padding:
                const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chinese Slide',
                  style: kbigtext.copyWith(color: kiconcolor, fontSize: 20),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Wrap(
                      children: List.generate(
                          5,
                          (index) => const Icon(
                                Icons.star_outline,
                                color: kprimarycolor,
                                size: 20,
                              )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '4.5',
                      style: ksmalltext.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.access_time_rounded,
                            color: kprimarycolor),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '15-20 min',
                          style: ksmalltext.copyWith(fontSize: 14),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Free when ordering a business lunch',
                  style: ksmalltext.copyWith(fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
