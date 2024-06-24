import 'package:flutter/material.dart';
import 'package:smart_parking/core/routes/name_routes.dart';

class AppNav {
  static void popFrom(BuildContext context) => Navigator.of(context).pop();

  static Future navigateTo(BuildContext context, String route,
      {bool replace = false, Object? arguments}) {
    if (replace) {
      return Navigator.pushNamedAndRemoveUntil(context, route, (route) => false,
          arguments: arguments);
    } else {
      return Navigator.pushNamed(context, route, arguments: arguments);
    }
  }

  static Future navigateToRoute(BuildContext context, String route,
          {bool replace = false, Object? arguments}) =>
      replace
          ? Navigator.pushNamedAndRemoveUntil(context, route, (route) => false,
              arguments: arguments)
          : Navigator.pushNamed(context, route, arguments: arguments);

  static Future navToCreditCard(BuildContext context) =>
      navigateTo(context, Routes.pathCredit);

  static Future navToCreditCardRP(BuildContext context) =>
      navigateToRoute(context, Routes.pathCredit, replace: true);

  static Future navToPayMethod(BuildContext context) =>
      navigateTo(context, Routes.pathPay);

  static Future navToReviewSummary(BuildContext context) =>
      navigateTo(context, Routes.pathReviewPayment);

  static Future navToTicket(BuildContext context) =>
      navigateTo(context, Routes.pathTicket);

  static Future navToWelcome(BuildContext context) =>
      navigateTo(context, Routes.pathWelcome);

  static Future navToLogin(BuildContext context) =>
      navigateTo(context, Routes.pathLogin);

  static Future navToParkingPlaces(BuildContext context) =>
      navigateTo(context, Routes.pathParkingPlaces);

  static Future navToBookAndPay(BuildContext context) =>
      navigateTo(context, Routes.pathBookAndPay);

  static Future navToHome(BuildContext context,
          {int tabIndex = 0, bool isWannaReplace = false}) =>
      navigateTo(context, Routes.pathHome,
          arguments: tabIndex, replace: isWannaReplace);

  static Future navToGetParking(BuildContext context) =>
      navigateTo(context, Routes.pathGetParking);

  static Future navToAddExtend(BuildContext context) =>
      navigateTo(context, Routes.pathExtendTime);

  static Future navToPayExtend(BuildContext context) =>
      navigateTo(context, Routes.pathExtendPay);

  static Future navToCancelExtend(BuildContext context) =>
      navigateTo(context, Routes.pathCancel);
}
