import 'dart:ui';

import 'package:flutter/cupertino.dart';

abstract class LoginNavigator {
  void showLoading();
  void hideLoading();
  void showMessage(
    String message, {
    String? posActionTitle,
    String? negActionTitle,
    VoidCallback? posAction,
    VoidCallback? negAction,
    bool isDismissible = true,
  });
  /// This function called when login is success and want to navigate to HomeScreen
  Future<void> navigate();
}
