import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodie/constants/colors.dart';

class Ingi extends StatelessWidget {
  final List<dynamic> ingis;

  Ingi(this.ingis);

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
            child: Image.asset(ingis[index]['ingiImage'])),
        const SizedBox(
          height: 7,
        ),
        Text(ingis[index]['ingiName'],
            style: const TextStyle(fontSize: 12, color: kIconColor)),
      ],
    );
  }
}

Future<String> fetchImage(String url) async {
  final gsRef = FirebaseStorage.instance.refFromURL(url);
  String imageUrl = await gsRef.getDownloadURL();
  return imageUrl;
}
