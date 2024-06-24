import 'package:flutter/material.dart';
import 'package:smart_parking/feature/auth/register/register_navigator.dart';
import 'package:smart_parking/feature/auth/repo/auth_repo_contract.dart';

class RegisterViewModel extends ChangeNotifier {
// class viewModel to handle logic

  late RegisterNavigator navigator;
  AuthenticationRepositoryContract repositoryContract;

  RegisterViewModel(this.repositoryContract);
  void register(String name, String phone, String email, String password,
      String confirmpassword) async {
    //loading how to access context ?
    // DialogUtils.showProgress(context, "Loading");
    //Todo fixing navigator messages places
    navigator.showLoading();
    try {
      var response = await repositoryContract.register(
          name, phone, email, password, confirmpassword);

      if (response == null) {
// hide loading
        navigator.hideLoading();
//showMEssage
        navigator.showMessage(response ?? 'error');
      } else {
//hideloading
        navigator.hideLoading();
        navigator.showMessage("Register successfully Done");
        await Future.delayed(const Duration(milliseconds: 1200));
        navigator.navigate();

        //  navigator.toHomePage();
      }
    } catch (e) {
//hide loading
      navigator.hideLoading();
      //show message
      navigator.showMessage("${e}Error while register ");
    }
  }
}
