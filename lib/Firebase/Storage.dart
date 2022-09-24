import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> downloadurl(String imagename) async {
    String downloadurl =
        await storage.ref('images/$imagename').getDownloadURL();
    return downloadurl;
  }
}
