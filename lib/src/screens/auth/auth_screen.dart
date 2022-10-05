
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:repeat/src/common/constants/color_constant.dart';
import 'package:repeat/src/common/constants/padding_constant.dart';
import 'package:repeat/src/common/models/tokens_model.dart';
import 'package:repeat/src/common/models/user_model.dart';
import 'package:repeat/src/router/routing_constants.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Dio dio = Dio();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:const CupertinoNavigationBar(
        middle: CustomTextWidget(str: 'Авторизация'),
        border: Border(),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
            Container(
              color: AppColors.white,
              child: Column(
                children: [
                  CustomTextFieldWidget(str: 'Логин или почта', controller: emailController),
                  const CustomDividerWidget(),
                  CustomTextFieldWidget(str: 'Пароль', controller: passwordController),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: AppPaddings.horizontal,
              child: CustomButtonWidget(str: 'Войти', 
              onPressed: () async{
                Box tokensBox = Hive.box('tokens');
                try{
                  Response response = await dio.post(
                    'http://188.225.83.80:6719/api/v1/auth/login',
                    data: {
                      'email': emailController.text,
                      'password': passwordController.text
                    },
                  );

                  TokensModel tokensModel = TokensModel.fromJson(
                    response.data['tokens']
                  );

                  tokensBox.put('accessToken', tokensModel.access);
                  tokensBox.put('refreshToken', tokensModel.refresh);

                  UserModel userModel = UserModel.fromJson(
                    response.data['user']
                  );

                  log(userModel.nickname.toString());

                  Navigator.pushReplacementNamed(context, MainRoute);
                } on DioError {
                  showCupertinoModalPopup(
                    context: context, 
                    builder: (context){
                      return CupertinoAlertDialog(
                        title: const Text('Ошибка'),
                        content: const Text('Неправильный логин или пароль!'),
                        actions: [
                          CupertinoButton(
                            child: const Text('Ok'), 
                            onPressed: ()=> Navigator.pop(context),
                          )
                        ],
                      );
                    }
                  );
                  rethrow;
                }
              }
              ),
            ),
            const SizedBox(height: 19),
            Padding(
              padding: AppPaddings.horizontal,
              child: CustomButtonWidget(
                str: 'Регистрация', 
                onPressed: () => Navigator.pushNamed(context, RegisterRoute) ,
              ),
            ),
          ],
        )
      ),
    );
  }
}

class CustomTextWidget extends StatelessWidget {
  final String str;
  const CustomTextWidget({
    Key? key,
    required this.str,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      str,
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String str;
  const CustomButtonWidget({
    Key? key,
    required this.str,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text(
        str,
        style: const TextStyle(
          color: AppColors.white
        ),
      ),
      color: AppColors.primary, 
      padding: AppPaddings.primary,
      onPressed: onPressed,
    );
  }
}

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.horizontal,
      child: Container(
        height: 1,
        color: AppColors.inActive,
      ),
    );
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  final String str;
  final TextEditingController? controller;
  const CustomTextFieldWidget({
    Key? key,
    required this.str,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: str,
      controller: controller,
      placeholderStyle: const TextStyle(
        color: AppColors.inActive,
      ),
      style: const TextStyle(
        color: Colors.black,
      ),
      padding: AppPaddings.primary,
      decoration:const  BoxDecoration(
        color: AppColors.white,
      ),
    );
  }
}