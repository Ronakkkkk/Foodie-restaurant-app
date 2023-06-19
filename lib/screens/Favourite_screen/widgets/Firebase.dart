import 'package:cloud_firestore/cloud_firestore.dart';

class FavFirebaseService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(Map<String, dynamic> userData) async {
    try {
      await usersCollection.doc('d_id').set(userData);
      await usersCollection.doc('d_id').collection('favourites').doc().set({
        'favoriteItem': 'exampleItem',
      });
      print('User data added successfully.');
    } catch (e) {
      print('Error adding user data: $e');
    }
  }
}
