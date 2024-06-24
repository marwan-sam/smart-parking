import 'package:flutter/material.dart';
import 'package:smart_parking/feature/auth/login/login_navigator.dart';
import 'package:smart_parking/feature/auth/repo/auth_repo_contract.dart';

class LoginViewModel extends ChangeNotifier {
  AuthenticationRepositoryContract repositoryContract;
  late LoginNavigator navigator;

  LoginViewModel(
    this.repositoryContract,
  );
  login(String email, String password) async {
    navigator.showLoading();
    try {
      var response = await repositoryContract.login(email, password);
      navigator.hideLoading();
      navigator.showMessage("Login successfully");
      await Future.delayed(const Duration(milliseconds: 1200));
      debugPrint('should navigate');
      navigator.navigate();
      //showmessage
    } catch (e) {
      navigator.hideLoading();
      navigator.showMessage("$e Error in login");
      //throw (e);
    }
  }
}
