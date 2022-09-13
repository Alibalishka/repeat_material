import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:repeat/src/common/constants/color_constant.dart';
import 'package:repeat/src/common/constants/padding_constant.dart';
import 'package:repeat/src/router/routing_constants.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.background,
      navigationBar:const CupertinoNavigationBar(
        middle: CustomTextWidget(str: 'Авторизация'),
        border: Border(),
        backgroundColor: AppColors.white,
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
            Container(
              color: AppColors.white,
              child: Column(
                children: const [
                  CustomTextFieldWidget(str: 'Логин или почта'),
                  CustomDividerWidget(),
                  CustomTextFieldWidget(str: 'Пароль'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: AppPaddings.horizontal,
              child: CustomButtonWidget(str: 'Войти', onPressed: () => Navigator.pushNamed(context, MainRoute)),
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
  const CustomTextFieldWidget({
    Key? key,
    required this.str,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: str,
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