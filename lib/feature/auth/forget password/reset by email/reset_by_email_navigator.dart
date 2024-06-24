import 'dart:ui';

abstract class ResetByEmailNavigator {
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
