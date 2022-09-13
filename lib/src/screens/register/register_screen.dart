import 'package:flutter/cupertino.dart';
import 'package:repeat/src/common/constants/color_constant.dart';
import 'package:repeat/src/common/constants/padding_constant.dart';
import 'package:repeat/src/screens/auth/auth_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.background,
      navigationBar: const CupertinoNavigationBar(
        middle: CustomTextWidget(str: 'Регистрация'),
        backgroundColor: AppColors.white,
        border: Border(),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Container(
              color: AppColors.white,
              child: Column(
                children: const[
                  CustomTextFieldWidget(str: 'Логин'),
                  CustomDividerWidget(),
                  CustomTextFieldWidget(str: 'Телефон'),
                  CustomDividerWidget(),
                  CustomTextFieldWidget(str: 'Почта'),
                  CustomDividerWidget(),
                  CustomTextFieldWidget(str: 'Пароль'),
                ],
              ),              
            ),
            const Spacer(),
            Padding(
              padding: AppPaddings.horizontal,
              child: CustomButtonWidget(str: 'Создать Аккаунт', onPressed: () {},),
            ),
            const SizedBox(height: 30),
          ],
        ), 
      ), 
    );
  }
}