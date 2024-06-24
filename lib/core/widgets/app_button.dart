import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_parking/core/utils/app_colors.dart';
import 'package:smart_parking/core/utils/app_style.dart';
import 'package:smart_parking/core/theme/theme.dart';
import 'package:smart_parking/core/theme/theme_provider.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final Color? colorButtonText;
  final TextStyle? textStyle;
  final void Function() onTap;
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final IconData? iconBeforeText;
  final double? sizeIconBeforeText;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.textStyle,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonWidth,
    this.buttonHeight,
    this.colorButtonText,
    this.iconBeforeText,
    this.sizeIconBeforeText,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeData == darkMode;
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ??
              (isDarkMode ? AppColors.colorLikeGrey : AppColors.colorLikeBlack),
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.h ?? 14.h,
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 50.w),
        ),
      ),
      onPressed: onTap,
      child: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (iconBeforeText != null)
                    Padding(
                      padding: EdgeInsets.only(right: 6.w),
                      child: Icon(iconBeforeText,
                          size: sizeIconBeforeText ?? 20,
                          color: colorButtonText ??
                              (!isDarkMode
                                  ? AppColors.colorWhite
                                  : AppColors.colorLikeWhite)),
                    ),
                  Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        AppTextStyles.forTextAnyButton.copyWith(
                            color: colorButtonText ??
                                (!isDarkMode
                                    ? AppColors.colorWhite
                                    : AppColors.colorLikeWhite)),
                  ),
                ],
              ),
      ),
    );
  }
}
