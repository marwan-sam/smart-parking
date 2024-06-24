// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:smart_parking/core/di/dependency_injection.dart';
import 'package:smart_parking/core/helper/extentions/app_regex.dart';
import 'package:smart_parking/core/helper/shared_pref_helper.dart';
import 'package:smart_parking/core/helper/shared_pref_keys.dart';
// import 'package:smart_parking/core/di/di.dart';
import 'package:smart_parking/core/routes/app_route.dart';
import 'package:smart_parking/core/theme/theme_provider.dart';
import 'package:smart_parking/feature/pay/checkout/stripe_payment/manager/key_api_stripe.dart';
import 'package:smart_parking/smart_parking_app.dart';

void main() async {
  setUpGetIt();
  await ScreenUtil.ensureScreenSize();
  Stripe.publishableKey = KeyAPIStripe.publishable;
  //WidgetsFlutterBinding.ensureInitialized();
  checkIfUserLoggedIn();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: SmartParkingApp(
        appRouter: AppRouter(),
      ),
    ),
  ); // ! it's original state code
  // * FOR-TEST ON UI (Is Rresponsive ?):
  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     tools: const [
  //       ...DevicePreview.defaultTools,
  //     ],
  //     builder: (context) =>  SmartParkingApp(appRouter: AppRouter(),),
  //   ),
  // );
}

checkIfUserLoggedIn() async {
  String userToken = await SharedPrefHelper.getString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
