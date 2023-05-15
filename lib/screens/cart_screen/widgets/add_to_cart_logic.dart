import 'package:cloud_firestore/cloud_firestore.dart';

class CartService {
  static Future<void> addToCart({
    required String image,
    required String name,
    required int price,
    required int quantity,
    required String userId,
  }) async {
    try {
      final cartItem = {
        'image': image,
        'name': name,
        'price': price,
        'quantity': quantity,
      };

      final userRef =
          FirebaseFirestore.instance.collection('users').doc(userId);
      final cartCollectionRef = userRef.collection('cart');
      await cartCollectionRef.add(cartItem);
    } catch (e) {
      // Handle error
      print('Error adding item to cart: $e');
    }
  }
}
