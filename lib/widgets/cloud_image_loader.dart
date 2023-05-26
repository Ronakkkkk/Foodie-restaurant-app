import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CloudImageLoader extends StatelessWidget {
  final String imageUrl;
  const CloudImageLoader(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Text('No data available');
          }
          return Image.network(snapshot.data!, fit: BoxFit.contain);
        },
        future: fetchImage(imageUrl));
  }
}

Future<String> fetchImage(String url) async {
  final gsRef = FirebaseStorage.instance.refFromURL(url);
  String imageUrl = await gsRef.getDownloadURL();
  return imageUrl;
}
