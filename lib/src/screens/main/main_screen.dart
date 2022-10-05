import 'package:flutter/cupertino.dart';
import 'package:repeat/src/common/constants/color_constant.dart';
import 'package:repeat/src/screens/auth/auth_screen.dart';
import 'package:repeat/src/screens/home/home_screen.dart';
import 'package:repeat/src/screens/map/map_screen.dart';
import 'package:repeat/src/screens/profile/profile_screen.dart';
import 'package:repeat/src/screens/wish/favourites_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: AppColors.white,
          border: const Border(),
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.map)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled)),
          ],
        ), 
        tabBuilder: (contest, index){
          return CupertinoTabView(
            builder: (context){
              switch (index){
                case 0:
                  return const HomeScreen();
                case 1:
                  return const MapScreen();
                case 2:
                  return const FavouritesScreen();
                case 3:
                  return const ProfileScreen();
                default:
                  return const AuthScreen();  
              }
            },
          );
        }
      ),
    );
  }
}