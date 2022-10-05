import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:repeat/src/common/constants/color_constant.dart';
import 'package:repeat/src/router/routing_constants.dart';
import 'package:repeat/src/screens/auth/auth_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.background,
      navigationBar: const CupertinoNavigationBar(
        middle: CustomTextWidget(str: 'Профиль'),
        backgroundColor: AppColors.white,
        border: Border(),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            const Icon(
              CupertinoIcons.profile_circled,
              size: 128,  
              color: Colors.black,
            ),
            const Text(
              'Tokhtarbay Ali',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
              fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'tokhtarbayali@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.inActive
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: AppColors.white,
              child: Column(
                children: [
                  CupertinoButton(
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Выход',
                        style: TextStyle(
                          color: AppColors.red,
                        ),
                      ),
                    ), 
                    onPressed: (){
                      log('work');
                      Navigator.of(context, rootNavigator: true).pushReplacementNamed(AuthRoute);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}