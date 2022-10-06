import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:repeat/src/common/constants/color_constant.dart';
import 'package:repeat/src/common/dependencies/injection_container.dart';
import 'package:repeat/src/router/router.dart';
import 'package:repeat/src/router/routing_constants.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('tokens');
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initialRoute = AuthRoute;
  @override
  void initState(){
    Box tokensBox = Hive.box('tokens');

    if(tokensBox.get('accessToken') != null || tokensBox.get('refreshToken') != null){
      initialRoute = MainRoute;
    }

    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: initialRoute,
      theme: const CupertinoThemeData(
        scaffoldBackgroundColor: AppColors.background,
        barBackgroundColor: AppColors.white
      ),
    );
  }
}