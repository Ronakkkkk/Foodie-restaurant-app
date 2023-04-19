import 'package:foodie/screens/home%20page/main_food_page%20.dart';
import 'package:foodie/screens/menuscreen/mainmenuscreen.dart';
import 'package:get/get.dart';

class Routehelper {
  static const String initial = "/";
  static const String foodesc = "/desc-page";

  static List<GetPage> routes = [
    GetPage(name: "/", page: (() => Foodpage())),
    GetPage(name: foodesc, page: (() => MenuScreen()))
  ];
}
