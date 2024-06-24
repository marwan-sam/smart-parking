import 'dart:ui';

abstract class ParkingPriceNavigator {
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
}
