import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavFirebaseService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> getCurrentUserId() async {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    }
    return null;
  }

  Future<void> addFav(Map<String, dynamic> userData, String? uid) async {
    try {
      await usersCollection
          .doc(uid)
          .collection('favourites')
          .doc()
          .set({'name': userData['name'], 'cuisine': userData['cuisine']});
      print('User data added successfully.');
    } catch (e) {
      print('Error adding user data: $e');
    }
  }
}
