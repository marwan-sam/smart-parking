import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_parking/core/utils/app_colors.dart';
import 'package:smart_parking/core/utils/app_style.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final TextStyle? styleText;
  final Function(String?) validator;
  final TextEditingController? controller;
  final bool? obscureText;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Color? backgroundColor;

  const AppTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
    this.controller,
    this.labelText,
    this.obscureText,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.hintStyle,
    this.suffixIcon,
    this.backgroundColor,
    this.styleText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 18.h,
            ),
        labelText: labelText,
        hintText: hintText,
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.colorLikeGrey, width: 1.3),
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.colorLikeBlack,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.colorLikeRed,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.colorLikeRed,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintStyle: hintStyle ?? AppTextStyles.midTitle18Nor,
        fillColor: backgroundColor ?? AppColors.colorLikeWhite,
        filled: true,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText ?? false,
      validator: (value) => validator(value),
      style: styleText ?? AppTextStyles.midTitle18Nor,
    );
  }
}
