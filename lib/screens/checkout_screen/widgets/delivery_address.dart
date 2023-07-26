import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/screens/checkout_screen/add_address/add_address.dart';

import '../../../constants/colors.dart';
import '../../../constants/texts.dart';
import '../../../firebase/addressinfo.dart';
import '../models/address.dart';

class DeliveryAddressListView extends StatefulWidget {
  final Function setDeliveryAddress;
  const DeliveryAddressListView(this.setDeliveryAddress, {super.key});

  @override
  State<DeliveryAddressListView> createState() =>
      _DeliveryAddressListViewState();
}

class _DeliveryAddressListViewState extends State<DeliveryAddressListView> {
  late CollectionReference _addressRef;
  late List<QueryDocumentSnapshot> addressItems = [];
  final addressFirestoreService _addressService = addressFirestoreService();

  @override
  void initState() {
    super.initState();
    getAddressCollectionReference();
  }

  Future<void> getAddressCollectionReference() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      String userId = user.uid;

      setState(() {
        _addressRef = FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('address');
      });
    }
  }

  int selectedIndex = -1;
  void addressChangeHandler(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });

    QueryDocumentSnapshot<Object?> selectedAddress = addressItems[newIndex];

    var addressDetails = selectedAddress['addressDetails'];
    var addressTitle = selectedAddress['addressTitle'];
    var locationLat = selectedAddress['locationLat'];
    var locationLng = selectedAddress['locationLng'];
    var placemarkName = selectedAddress['placemarkName'];
    var placemarkSubname = selectedAddress['placemarkSubname'];
    var placemarkPostalCode = selectedAddress['placemarkPostalCode'];
    var placemarkCountry = selectedAddress['placemarkCountry'];
    var userAltPhone = selectedAddress['userAltPhone'];
    var userName = selectedAddress['userName'];
    var userOrganization = selectedAddress['userOrganization'];
    var userPhone = selectedAddress['userPhone'];

    widget.setDeliveryAddress(Address(
      addressDetails,
      addressTitle,
      locationLat,
      locationLng,
      placemarkName,
      placemarkSubname,
      placemarkPostalCode,
      placemarkCountry,
      userAltPhone,
      userName,
      userOrganization,
      userPhone,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _addressRef.snapshots(),
        builder: (context, snapshot) {
          if (addressItems.isEmpty) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              Timer(const Duration(seconds: 4), () {});
              return Container(
                height: 160,
                padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
                child: Row(
                  children: [
                    Container(
                      color: Colors.grey,
                      width: 200,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      color: Colors.grey,
                      width: 100,
                    ),
                  ],
                ),
              );
              // Show a loading indicator while waiting for data
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
          }

          addressItems = snapshot.data!.docs;

          return Container(
            height: 160,
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: addressItems.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == addressItems.length) {
                  // Last item, display "Add New Address" widget
                  return _addAddress();
                } else {
                  // Display address widget for existing documents
                  return _deliveryAddress(addressItems[index], index);
                }
              },
              separatorBuilder: (context, index) => const SizedBox(width: 11),
            ),
          );
        });
  }

  Widget _deliveryAddress(
      QueryDocumentSnapshot<Object?> addressItem, int index) {
    Color bgColor = (index == selectedIndex) ? kPrimaryColor : Colors.white;
    Color textColor = (index == selectedIndex) ? Colors.white : kPrimaryColor;
    Color iconColor =
        (index == selectedIndex) ? Colors.lightGreen : kPrimaryColor;
    return GestureDetector(
      onTap: () => addressChangeHandler(index),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 240,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: bgColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  addressItem['addressTitle'],
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
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    '${addressItem['placemarkName']}, ${addressItem['placemarkSubname']} \n${addressItem['placemarkPostalCode']}, ${addressItem['placemarkCountry']}',
                    style: kSmallText.copyWith(fontSize: 16),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    String? userId = await _addressService
                        .getCurrentUserId(); // Get the user ID
                    if (userId != null) {
                      _addressService.deleteAddress(
                        userId,
                        addressItem.id, // Pass the document ID
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
                addressItem['userPhone'],
                style: kSmallText.copyWith(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addAddress() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddAddressScreen()));
        addressItems.clear();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 10),
              child: Icon(Icons.add_location, color: kPrimaryColor),
            ),
            SizedBox(
              width: 60,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('Add New \n Address',
                    textAlign: TextAlign.center,
                    style: kSmallText.copyWith(
                        fontSize: 14, color: kPrimaryColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
