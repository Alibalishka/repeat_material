import 'package:flutter/cupertino.dart';
import 'package:repeat/src/common/constants/color_constant.dart';
import 'package:repeat/src/router/router.dart';
import 'package:repeat/src/router/routing_constants.dart';
import 'package:repeat/src/screens/auth/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AuthRoute,
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: AppColors.background,
        barBackgroundColor: AppColors.white
      ),
    );
  }
}