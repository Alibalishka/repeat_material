import 'package:flutter/cupertino.dart';
import 'package:repeat/src/router/routing_constants.dart';
import 'package:repeat/src/screens/auth/auth_screen.dart';
import 'package:repeat/src/screens/detail/detail_screen.dart';
import 'package:repeat/src/screens/home/home_screen.dart';
import 'package:repeat/src/screens/main/main_screen.dart';
import 'package:repeat/src/screens/map/map_screen.dart';
import 'package:repeat/src/screens/profile/profile_screen.dart';
import 'package:repeat/src/screens/register/register_screen.dart';

class AppRouter{
  static Route generateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case AuthRoute:
        return CupertinoPageRoute(
          builder: (context) => const AuthScreen(),
        );
      case RegisterRoute:
        return CupertinoPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      case MainRoute:
        return CupertinoPageRoute(
          builder: (context) => const MainScreen(),
        );
      case HomeRoute:
        return CupertinoPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case MapRoute:
        return CupertinoPageRoute(
          builder: (context) => const MapScreen(),
        );
      case ProfileRoute:
        return CupertinoPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case RestaurantDetailRoute:
        return CupertinoPageRoute(
          builder: (context) => const DetailScreen(), 
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => const AuthScreen(), 
        );
    }
  }
}