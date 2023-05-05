import 'package:flutter/material.dart';
import 'package:foodie/constants/colors.dart';

class Ingi extends StatelessWidget {
  final List<Image> list;
  final List<String> list1;

  const Ingi(this.list, this.list1);

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
              itemCount: list.length),
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
            child: list[index]),
        const SizedBox(
          height: 7,
        ),
        Text(list1[index],
            style: const TextStyle(fontSize: 12, color: kIconColor)),
      ],
    );
  }
}
