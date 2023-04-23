// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:foodie/Firebase/auth.dart';
import 'package:foodie/screens/home%20page/foodmenu.dart';
import 'package:foodie/screens/home%20page/main_food_page%20.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:foodie/screens/login_screen/main_intro_screen.dart';
import 'package:foodie/screens/login_screen/register.dart';
import 'package:foodie/screens/login_screen/registerinfo.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MultiProvider(
      providers: [
        Provider<auth>(create: (_) => auth()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Foodie',
          home: RegisterScreen()),
    );
  }
}

// class Authenticationwrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final firebaseuser = context.watch<User>();

//     if (firebaseuser != null) {
//       return Foodpage();
//     } else {
//       return Mainintroscreen();
//     }
//   }
// }