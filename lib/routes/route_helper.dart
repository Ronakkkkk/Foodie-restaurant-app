import 'package:foodie/screens/home_page/main_food_page.dart';
import 'package:foodie/screens/menu_screen/main_menu_screen.dart';

import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String foodesc = "/desc-page";

  static List<GetPage> routes = [
    GetPage(name: "/", page: (() => FoodPage())),
  ];
}
