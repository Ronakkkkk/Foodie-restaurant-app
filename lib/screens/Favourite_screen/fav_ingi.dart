import 'package:flutter/material.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/widgets/cloud_image_loader.dart';
import 'package:foodie/widgets/ingredients.dart';

class Favingi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List ingis = [
      'assets/images/steak.png',
      'assets/images/cheese.png',
      'assets/images/vegetable.png'
    ];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 50,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _ingicontext(index, ingis);
                },
                separatorBuilder: ((context, index) => const SizedBox(
                      width: 12,
                    )),
                itemCount: ingis.length),
          ),
        ],
      ),
    );
  }

  Widget _ingicontext(int index, List ingis) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 30,

          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          // child: Text('${list[index]}'),
          child: Image(
            image: AssetImage(ingis[index]),
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
