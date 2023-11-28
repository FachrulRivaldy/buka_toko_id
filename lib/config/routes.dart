import 'package:bukatokoid/screens/cart_screen.dart';
import 'package:bukatokoid/screens/favorite_screen.dart';
import 'package:bukatokoid/screens/home_screen.dart';
import 'package:bukatokoid/screens/profile_screen.dart';
import 'package:get/get.dart';

class PageRouteApp {
  static final pages = [
    GetPage(
      name: RouteName.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RouteName.favorite,
      page: () => const FavoriteScreen(),
    ),
    GetPage(
      name: RouteName.cart,
      page: () => const CartScreen(),
    ),
    GetPage(
      name: RouteName.profile,
      page: () => const ProfileScreen(),
    ),
  ];
}

abstract class RouteName {
  static const home = '/home';
  static const favorite = '/favorite';
  static const cart = '/cart';
  static const profile = '/profile';
}
