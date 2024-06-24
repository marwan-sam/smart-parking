import 'package:flutter/foundation.dart';
import 'package:smart_parking/feature/auth/forget%20password/password%20and%20confirm%20password/forget_navigator.dart';
import 'package:smart_parking/feature/auth/model/forget%20pass/forget_password_request_model.dart';
import 'package:smart_parking/feature/auth/repo/auth_repo_contract.dart';

class ForgetPasswordViewModel extends ChangeNotifier {
  AuthenticationRepositoryContract repositoryContract;

  late ForgetPasswordNavigator navigator;

  ForgetPasswordViewModel(this.repositoryContract);
//Todo function

  ForgetPassword(ForgetPasswordRequestModel forgetPasswordRequest) async {
    navigator.showLoading();

    try {
      var response =
          await repositoryContract.forgetPassword(forgetPasswordRequest);
      navigator.hideLoading();
      navigator.showMessage("password reset succesfflly");
      await Future.delayed(const Duration(milliseconds: 1200));
      navigator.navigate();
    } catch (e) {
      navigator.hideLoading();
      navigator.showMessage("${e}error to reset password");
    }
  }
}
