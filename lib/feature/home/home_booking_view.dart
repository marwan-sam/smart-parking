import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_parking/core/helper/shared_pref_keys.dart';
import 'package:smart_parking/core/utils/app_colors.dart';
import 'package:smart_parking/core/utils/app_nav.dart';
import 'package:smart_parking/core/widgets/app_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeBookingView extends StatelessWidget {
  const HomeBookingView({super.key});

  Future<int> _getPrice() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(SharedPrefKeys.getPrice) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: FadeInDown(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10.h),
                  Image.asset(
                    "assets/images/LogoAnimation-gif.gif",
                    width: 400.w,
                    height: 400.h,
                  ),
                  SizedBox(height: 20.h),
                  // * if user not booked show this button:
                  FutureBuilder<int>(
                    future: _getPrice(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        int? price = snapshot.data;
                        if (price == 0 || price == null) {
                          return FadeInUp(
                            from: 50,
                            child: AppButton(
                              buttonText: "Book Now",
                              onTap: () => AppNav.navToGetParking(context),
                            ),
                          );
                        } else {
                          return Column(
                            children: [
                              SizedBox(height: 20.h),
                              // * else if user have booking show this button:
                              FadeInLeft(
                                from: 50,
                                child: AppButton(
                                  buttonText: "Extra Time",
                                  iconBeforeText: FontAwesomeIcons.stopwatch,
                                  sizeIconBeforeText: 18,
                                  backgroundColor: AppColors.colorSuccAlert,
                                  onTap: () => AppNav.navToPayExtend(context),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              // * FOR cancel booking
                              FadeInRight(
                                from: 50,
                                child: AppButton(
                                  buttonText: "Cancel Time Booking",
                                  iconBeforeText: FontAwesomeIcons.ban,
                                  sizeIconBeforeText: 18,
                                  backgroundColor: AppColors.colorLikeRed,
                                  onTap: () =>
                                      AppNav.navToCancelExtend(context),
                                ),
                              ),
                            ],
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
