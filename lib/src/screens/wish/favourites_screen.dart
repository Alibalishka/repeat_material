import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:repeat/src/common/constants/color_constant.dart';
import 'package:repeat/src/screens/auth/auth_screen.dart';

import '../../common/constants/padding_constant.dart';
import '../home/home_screen.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  bool like = true;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.background,
      navigationBar: const CupertinoNavigationBar(
        middle: CustomTextWidget(str: 'Избранные'),
        backgroundColor: AppColors.white,
        border: Border(),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: 1,
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: AppPaddings.horizontal,
                    child: Container(
                      height: 246,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/image/essentai.jpeg',
                                height: 150,
                                fit: BoxFit.fitWidth,
                                width: double.infinity,
                              ),
                          ),

                          Padding(
                            padding: AppPaddings.primary,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const[
                                      CustomTextParameterWidget(text: 'Essentai Mall', fontweght: FontWeight.bold),
                                      CustomTextParameterWidget(text: 'Один из крупнейших торговых центров в городе Алмата.' , fontweght: FontWeight.normal),
                                      CustomTextParameterWidget(text: 'Аль-Фараби', fontweght: FontWeight.normal),
                                    ],
                                  ),
                                ),
                                CupertinoButton(
                                  child: Icon(like ? CupertinoIcons.heart : CupertinoIcons.heart_fill, color: Colors.red), 
                                  onPressed: (){
                                    setState(() {
                                      like = !like;
                                    });
                                  }
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}