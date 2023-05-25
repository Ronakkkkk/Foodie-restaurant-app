import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserFirestoreService {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String?> getCurrentUserId() async {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    }
    return null;
  }

  Future<void> addUser(
    String userId,
    String name,
    String email,
    String address,
  ) async {
    try {
      await _usersCollection.doc(userId).set({
        'name': name,
        'email': email,
        'address': address,

        // Add any additional user data you want to store
      });
    } catch (e) {
      // Handle any errors that occur during document creation
      print('Error adding user: $e');
    }
  }
}
