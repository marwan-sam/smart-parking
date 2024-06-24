import 'package:flutter/material.dart';
import 'package:smart_parking/feature/auth/model/price/price_request_model.dart';
import 'package:smart_parking/feature/auth/repo/auth_repo_contract.dart';
import 'package:smart_parking/feature/home/parking_pirce_navigator.dart';

class ParkingViewModel extends ChangeNotifier {
  AuthenticationRepositoryContract repositoryContract;

  late ParkingPriceNavigator navigator;

  ParkingViewModel(this.repositoryContract);

  Price(PriceRequestModel priceRequestModel) async {
    navigator.showLoading();
    try {
      var response = await repositoryContract.price(priceRequestModel);
      navigator.hideLoading();
      navigator.showMessage(response.toString());
    } catch (e) {
      navigator.hideLoading();
      navigator.showMessage("$e Error to show price");
    }
  }
}
