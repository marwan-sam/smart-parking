import 'package:flutter/material.dart';
import 'package:smart_parking/feature/auth/forget%20password/reset%20by%20email/reset_by_email_navigator.dart';
import 'package:smart_parking/feature/auth/repo/auth_repo_contract.dart';

class ResetByEmailViewModel extends ChangeNotifier {
  AuthenticationRepositoryContract repositoryContract;

  late ResetByEmailNavigator navigator;

  String? _email;

  String? get email => _email;

  ResetByEmailViewModel(this.repositoryContract);
  resetByEmailFunction(String email) async {
    _email = null;
    navigator.showLoading();
    try {
      var response = await repositoryContract.resetByEmail(email);
      navigator.hideLoading();
      navigator.showMessage("Code sent to your email");
      await Future.delayed(const Duration(milliseconds: 1200));
      navigator.navigate();
      _email = email;
    } catch (e) {
      navigator.hideLoading();
      navigator.showMessage("$e error to send code ");
    }
  }
}
