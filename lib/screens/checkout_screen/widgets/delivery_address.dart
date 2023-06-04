import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/screens/checkout_screen/add_address/add_address.dart';

import '../../../constants/colors.dart';
import '../../../constants/texts.dart';
import '../../../firebase/addressinfo.dart';

class DeliveryAddressListView extends StatefulWidget {
  final int selectedIndex;
  final Function sendDeliveryAddress;
  const DeliveryAddressListView(this.selectedIndex, this.sendDeliveryAddress,
      {super.key});

  @override
  State<DeliveryAddressListView> createState() =>
      _DeliveryAddressListViewState();
}

class _DeliveryAddressListViewState extends State<DeliveryAddressListView> {
  late String userId;
  late CollectionReference addressCollection =
      FirebaseFirestore.instance.collection('users');
  late List<QueryDocumentSnapshot> addressItems = [];
  addressFirestoreService firestoreService = addressFirestoreService();

  void changeSelectedIndex(newIndex) {
    widget.sendDeliveryAddress(newIndex);
  }

  @override
  void initState() {
    super.initState();
    fetchAddressItems();
  }

  Future<void> fetchAddressItems() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      String userId = user.uid;

      setState(() {
        addressCollection = FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('address');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: addressCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(); // Show a loading indicator while waiting for data
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          List<QueryDocumentSnapshot> addressItems = snapshot.data!.docs;
          return Container(
            height: 160,
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: addressItems.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == addressItems.length) {
                  // Last item, display "Add New Address" widget
                  return _addAddress(context);
                } else {
                  // Display address widget for existing documents
                  return _deliveryAddress(addressItems, index);
                }
              },
              separatorBuilder: (context, index) => SizedBox(
                width: 11,
              ),
            ),
          );
        });
  }

  Widget _deliveryAddress(List address, int index) {
    Color bgColor =
        (index == widget.selectedIndex) ? kPrimaryColor : Colors.white;
    Color textColor =
        (index == widget.selectedIndex) ? Colors.white : kPrimaryColor;
    Color iconColor =
        (index == widget.selectedIndex) ? Colors.lightGreen : kPrimaryColor;
    final addressData = address[index].data();
    return GestureDetector(
      onTap: () => changeSelectedIndex(index),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 240,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: bgColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  address[index]['addressTitle'],
                  style: kCredText.copyWith(fontSize: 18, color: textColor),
                ),
                Icon(
                  Icons.edit,
                  color: textColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  child: Text(
                    '${address[index]['placemarkName']}, ${address[index]['placemarkSubname']} \n44600, Nepal',
                    style: kSmallText.copyWith(fontSize: 16),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    String? userId = await firestoreService
                        .getCurrentUserId(); // Get the user ID
                    if (userId != null) {
                      firestoreService.deleteAddress(
                        userId,
                        address[index].id, // Pass the document ID
                      );
                    }
                  },
                  child: Icon(
                    Icons.delete,
                    color: textColor,
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(
                address[index]['userPhone'],
                style: kSmallText.copyWith(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _addAddress(context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddAddressScreen()));
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16.0, bottom: 10),
            child: Icon(Icons.add_location, color: kPrimaryColor),
          ),
          SizedBox(
            width: 60,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text('Add New \n Address',
                  textAlign: TextAlign.center,
                  style:
                      kSmallText.copyWith(fontSize: 14, color: kPrimaryColor)),
            ),
          ),
        ],
      ),
    ),
  );
}
