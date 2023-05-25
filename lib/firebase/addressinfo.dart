import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class addressFirestoreService {
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

  Future<void> addAddress(
      String userId,
      String title,
      String name,
      String organization,
      String location,
      String number,
      String alnumber) async {
    try {
      DocumentReference userDocRef = _usersCollection.doc(userId);
      CollectionReference addressSubcollection =
          userDocRef.collection('address');

      await addressSubcollection.add({
        'name': name,
        'title': title,
        'org': organization,
        'location': location,
        'number': number,
        'alnumber': alnumber,
      });
    } catch (e) {
      // Handle any errors that occur during document creation
      print('Error adding address: $e');
    }
  }

  Future<void> deleteAddress(String userId, String addressId) async {
    try {
      DocumentReference userDocRef = _usersCollection.doc(userId);
      CollectionReference addressSubcollection =
          userDocRef.collection('address');

      await addressSubcollection.doc(addressId).delete();
    } catch (e) {
      // Handle any errors that occur during document deletion
      print('Error deleting address: $e');
    }
  }
}
