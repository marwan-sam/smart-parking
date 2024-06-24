import 'package:flutter/material.dart';

abstract class RegisterNavigator {
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
  Future<void> navigate();

}
