import 'dart:ui';
abstract class ForgetPasswordNavigator {
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
