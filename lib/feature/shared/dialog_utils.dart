import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogUtils {
  static void showProgress(BuildContext context, String message,
      {bool isDismissible = true}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              SizedBox(width: 12.w),
              Text(message),
            ],
          ),
        );
      },
      barrierDismissible: isDismissible,
    );
  }

  static void showMessage(
    BuildContext context,
    String message, {
    String? posActionTitle,
    String? negActionTitle,
    VoidCallback? posAction,
    VoidCallback? negAction,
    bool isDismissible = true,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            if (negActionTitle != null && negAction != null)
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  negAction();
                },
                child: Text(negActionTitle),
              ),
            if (posActionTitle != null && posAction != null)
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  posAction();
                },
                child: Text(posActionTitle),
              ),
          ],
        );
      },
      barrierDismissible: isDismissible,
    );
  }
}
