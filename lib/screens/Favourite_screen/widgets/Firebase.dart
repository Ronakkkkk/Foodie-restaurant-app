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
      List<String> ingredients = [];
      await usersCollection.doc(uid).collection('favourites').doc().set({
        'name': userData['name'],
        'cuisine': userData['cuisine'],
        'image': userData['image'],
        'price': userData['price'].toString(),
        'ingredients': userData['ingredients']
      });
      print('User data added successfully.');
    } catch (e) {
      print('Error adding user data: $e');
    }
  }

  Future<void> deleteFav(String? uid, String documentId) async {
    try {
      await usersCollection
          .doc(uid)
          .collection('favourites')
          .doc(documentId)
          .delete();
      print('Document deleted successfully.');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }
}
