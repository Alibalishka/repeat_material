import 'package:flutter/cupertino.dart';
import 'package:repeat/src/common/constants/color_constant.dart';
import 'package:repeat/src/screens/auth/auth_screen.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.background,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: AppColors.white,
        middle: CustomTextWidget(str: 'Карта'),
        border: Border(),
      ),
      child: SafeArea(
        child: Column(
          children:const [

          ],
        ),
      ), 
    );
  }
}