import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:foodie/constants/colors.dart';
import 'package:foodie/screens/profile_screen/bottom_row.dart';
import 'package:foodie/screens/profile_screen/name_screen.dart';
import 'package:foodie/screens/profile_screen/widget_container.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  late String userId;

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      userId = user.uid;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackground,
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(userId)
                .snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
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
              Map<String, dynamic> data =
                  snapshot.data?.data() as Map<String, dynamic>;
              return Column(
                children: [
                  Namescreen(data),
                  const SizedBox(
                    height: 20,
                  ),
                  WidgetContainer(),
                  const SizedBox(
                    height: 15,
                  ),
                  const BottomRow()
                ],
              );
            }),
      ),
    );
  }
}
