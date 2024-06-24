
abstract class RecivingCodeNavigator {
  void showLoading();
  void hideLoading();
  void showMessage(
      String message, {
        String? posActionTitle,
        String? negActionTitle,
        //TODO it shows error while running
     //  VoidCallback? posAction,
       // VoidCallback? negAction,
        bool isDismissible = true,
      });
  Future<void> navigate();

}