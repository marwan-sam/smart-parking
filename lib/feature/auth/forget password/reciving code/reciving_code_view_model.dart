import 'package:flutter/cupertino.dart';
import 'package:smart_parking/feature/auth/repo/auth_repo_contract.dart';

import 'reciving_code_navigator.dart';

class RecivingCodeViewModel extends ChangeNotifier {
  AuthenticationRepositoryContract repositoryContract;
  late RecivingCodeNavigator navigator;
  RecivingCodeViewModel(this.repositoryContract);

  // ignore: non_constant_identifier_names
  RecivingCodeFunction(String error) async {
    navigator.showLoading();

    try {
      var response = await repositoryContract.codeCheck(error);
      navigator.hideLoading();
      navigator.showMessage("Code verified ");
      await Future.delayed(const Duration(milliseconds: 1200));
      navigator.navigate();
    } catch (e) {
      navigator.hideLoading();
      navigator.showMessage("$e Error in code");
      //throw (e);
    }
  }
}
