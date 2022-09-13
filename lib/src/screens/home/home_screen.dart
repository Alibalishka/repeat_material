import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:repeat/src/common/constants/color_constant.dart';
import 'package:repeat/src/common/constants/padding_constant.dart';
import 'package:repeat/src/router/routing_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool like = true;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.background,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: AppPaddings.horizontal,
              child: CupertinoSearchTextField(
                backgroundColor: AppColors.white,
                style: TextStyle(
                  color: Colors.black,
                ),
                itemColor: AppColors.inActive,        
                padding: AppPaddings.primary,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: AppPaddings.horizontal,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context, rootNavigator: true).pushNamed(RestaurantDetailRoute),
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

class CustomTextParameterWidget extends StatelessWidget {
  
  final String text;
  final FontWeight fontweght;

  const CustomTextParameterWidget({
    Key? key,
    required this.text,
    required this.fontweght,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: fontweght,
      ),
    );
  }
}