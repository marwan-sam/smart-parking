import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_parking/core/helper/shared_pref_helper.dart';
import 'package:smart_parking/core/utils/app_colors.dart';
import 'package:smart_parking/core/utils/app_nav.dart';
import 'package:smart_parking/core/utils/app_style.dart';
import 'package:smart_parking/core/widgets/app_button.dart';
import 'package:smart_parking/feature/auth/login/login_screen.dart';

class ShowBottomModal extends StatelessWidget {
  const ShowBottomModal({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: SizedBox(
          height: 250,
          child: Column(
            children: [
              Text(
                "Logout",
                style: AppTextStyles.midTitle18Bold.copyWith(
                  color: AppColors.colorLikeRed,
                ),
              ),
              SizedBox(height: 20.h),
              Divider(height: 8.h),
              SizedBox(height: 20.h),
              Text(
                "Are you sure you want to logout?",
                style: AppTextStyles.font15BoldWithoutColor,
              ),
              SizedBox(height: 30.h),
              Column(
                children: [
                  FadeInLeft(
                    from: 50,
                    child: AppButton(
                      buttonText: "Yes, Logout",
                      colorButtonText: AppColors.colorLikeWhite,
                      backgroundColor: AppColors.colorLikeRed,
                      onTap: () => logoutAction(context),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  FadeInRight(
                    from: 50,
                    child: AppButton(
                      buttonText: "Cancel",
                      colorButtonText: AppColors.colorLikeWhite,
                      backgroundColor: AppColors.colorLikeGrey,
                      onTap: () => AppNav.popFrom(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  logoutAction(context) async {
    await SharedPrefHelper.clearAllData();
    debugPrint("!!!!!!!!!!! LOGOUT : !!!!!!!!");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }
}
