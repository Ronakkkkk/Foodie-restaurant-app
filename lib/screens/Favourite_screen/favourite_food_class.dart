import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/texts.dart';

class FoodTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Stack(
        children: [
          Container(
            height: 200,
            margin: const EdgeInsets.only(top: 25, right: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: kPrimaryColor,
              // image: DecorationImage(
              //     image: AssetImage('assets/images/Capture.PNG'),
              //     fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 330,
              margin: const EdgeInsets.only(left: 25, right: 30, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 15, left: 20, right: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chinese Slide',
                      style: kBigText.copyWith(color: kIconColor, fontSize: 20),
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
                              color: kPrimaryColor,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '4.5',
                          style: kSmallText.copyWith(fontSize: 16),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.access_time_rounded,
                                color: kPrimaryColor),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '15-20 min',
                              style: kSmallText.copyWith(fontSize: 14),
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
                      style: kSmallText.copyWith(fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
