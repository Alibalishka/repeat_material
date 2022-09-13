import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:repeat/src/common/constants/color_constant.dart';
import 'package:repeat/src/common/constants/padding_constant.dart';
import 'package:repeat/src/screens/auth/auth_screen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:transparent_cupertino_navigationbar/transparent_cupertino_navigationbar.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const TransparentCupertinoNavigationBar(
        actionsForegroundColor: AppColors.white,
      ),
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              minHeight: 100, 
              minWidth: double.infinity, 
              maxHeight: 400,
            ),
            child: Image.asset('assets/image/essentai.jpeg'),
          ),
          
          Padding(
            padding: AppPaddings.primary,
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text(
                    'Описание',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20
                    ),
                  ),
                  ReadMoreText(
                    'Esentai Mall – единственный люксовый молл в Центральной Азии с эксклюзивным ассортиментом брендов и товаров.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Подробнее',
                    trimExpandedText: ' назад',
                    lessStyle: TextStyle(
                      color: AppColors.primary
                    ),
                    moreStyle: TextStyle(
                      color: AppColors.primary,
                    ),
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                ],
              ),
            ),
          ),
          const CustomDividerWidget(),
          Padding(
            padding: AppPaddings.primary,
            child: Column(
              children: const [
                CustomRow(text: 'Работаем с 20:00 до 18:00', icon: Icon(CupertinoIcons.clock, color: Colors.black)),
                SizedBox(height: 10),
                CustomRow(text: 'Аль-Фараби', icon: Icon(CupertinoIcons.location_solid, color: Colors.black)),
              ],
            ),
          ),
          const CustomDividerWidget(),
        ],
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  final String text;
  final Icon icon;
  const CustomRow({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 5),
        Text(
          text,
          
        ),
      ],
    );
  }
}