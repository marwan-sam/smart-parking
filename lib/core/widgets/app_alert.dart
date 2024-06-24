import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_parking/core/utils/app_colors.dart';

import '../utils/app_style.dart';
import 'app_button.dart';

class AppAlert extends StatelessWidget {
  final String title;
  final String content;
  final String btnString;
  final String pathImage;
  final bool isSucc;
  final VoidCallback continueCallBack;

  const AppAlert({
    super.key,
    required this.title,
    required this.content,
    required this.btnString,
    required this.pathImage,
    required this.isSucc,
    required this.continueCallBack,
  });
  //TextStyle textStyle = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      from: 50,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
          title: Image.asset(pathImage),
          content: SizedBox(
            width: 400.w,
            height: 150.h,
            child: Column(
              children: [
                Text(
                  title,
                  style: AppTextStyles.titleAlert.copyWith(
                    color: isSucc
                        ? AppColors.colorSuccAlert
                        : AppColors.colorLikeRed,
                  ),
                ),
                Text(
                  content,
                  style: AppTextStyles.contentAlert,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            AppButton(
              buttonText: btnString,
              onTap: continueCallBack,
            ),
          ],
        ),
      ),
    );
  }
}
