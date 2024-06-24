import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_parking/core/utils/app_style.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    leading: Center(
      child: SvgPicture.asset(
        'assets/images/arrow.svg',
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: AppTextStyles.checkoutStyle25,
    ),
  );
}
