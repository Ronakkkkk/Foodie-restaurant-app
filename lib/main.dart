import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodie/Firebase/auth.dart';
import 'package:foodie/screens/home_page/main_food_page.dart';
import 'package:foodie/screens/login_screen/main_intro_screen.dart';
import 'package:foodie/screens/login_screen/register_info.dart';
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
          home: RegisterInfoScreen()),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final firebaseUser = auth.currentUser;

    if (firebaseUser != null) {
      return FoodPage();
    } else {
      return const MainIntroScreen();
    }
  }
}
