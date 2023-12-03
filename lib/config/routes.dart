import 'package:bukatokoid/screens/all_product_screen.dart';
import 'package:bukatokoid/screens/cart_screen.dart';
import 'package:bukatokoid/screens/favorite_screen.dart';
import 'package:bukatokoid/screens/home_screen.dart';
import 'package:bukatokoid/screens/login_screen.dart';
import 'package:bukatokoid/screens/main_screen.dart';
import 'package:bukatokoid/screens/notification_screen.dart';
import 'package:bukatokoid/screens/profile_screen.dart';
import 'package:bukatokoid/screens/register_screen.dart';
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
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: RouteName.allProducts,
      page: () => const AllProductScreen(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: RouteName.notification,
      page: () => const NotificationScreen(),
    ),
    GetPage(
      name: RouteName.register,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: RouteName.main,
      page: () => const MainScreen(),
    ),
  ];
}

abstract class RouteName {
  static const main = '/main';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const favorite = '/favorite';
  static const cart = '/cart';
  static const profile = '/profile';
  static const allProducts = '/allProducts';
  static const notification = '/notification';
}
