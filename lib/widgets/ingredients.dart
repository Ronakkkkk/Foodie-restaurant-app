import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodie/constants/Colors.dart';
import 'package:foodie/constants/texts.dart';

class ingi extends StatelessWidget {
  final List<Image> list;
  final List<String> list1;

  const ingi(this.list, this.list1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 47),
          height: 80,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _ingicontext(index);
              },
              separatorBuilder: ((context, index) => SizedBox(
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
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            // child: Text('${list[index]}'),
            child: list[index]),
        SizedBox(
          height: 7,
        ),
        Text('${list1[index]}',
            style: TextStyle(fontSize: 12, color: kiconcolor)),
      ],
    );
  }
}
