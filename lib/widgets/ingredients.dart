import 'package:flutter/material.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/widgets/cloud_image_loader.dart';

class Ingi extends StatelessWidget {
  final List<dynamic> ingis;

  const Ingi(this.ingis, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 47),
          height: 80,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _ingicontext(index);
              },
              separatorBuilder: ((context, index) => const SizedBox(
                    width: 40,
                  )),
              itemCount: ingis.length),
        ),
      ],
    );
  }

  Widget _ingicontext(int index) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(13),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          // child: Text('${list[index]}'),
          child: CloudImageLoader(ingis[index]['ingiImage']),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(ingis[index]['ingiName'],
            style: const TextStyle(fontSize: 12, color: kIconColor)),
      ],
    );
  }
}
