import 'package:smart_parking/feature/auth/model/forget%20pass/forget_password_request_model.dart';
import 'package:smart_parking/feature/auth/model/price/price_request_model.dart';
import 'package:smart_parking/feature/auth/repo/auth_repo_contract.dart';

// class AuthREpositoryImpl handling response body of class AuthenticationRepositoryContract
class AuthREpositoryImpl implements AuthenticationRepositoryContract {
  AuthReomteDataSource reomteDataSource;
  AuthREpositoryImpl(this.reomteDataSource);

  @override
  Future<String?> login(String email, String password) async {
    var response = await reomteDataSource.login(email, password);
    return response.message;
  }

  @override
  Future<String?> register(String name, String phone, String email,
      String password, String confirmPassword) async {
    var response = await reomteDataSource.register(
        name, phone, email, password, confirmPassword);
    return response.message;
  }

  @override
  Future<String?> forgetPassword(
      ForgetPasswordRequestModel forgetPasswordRequest) async {
    var response = await reomteDataSource.forgetPassword(forgetPasswordRequest);
    return response.message;
  }

  @override
  Future<String?> resetByEmail(String email) async {
    var response = await reomteDataSource.resetByEmail(email);
    return response!.message;
  }

  @override
  Future<String?> codeCheck(String error) async {
    var response = await reomteDataSource.codeCheck(error);
    return response!.error;
  }

  @override
  Future<double?> price(PriceRequestModel priceRequestModel) async {
    var response = await reomteDataSource.price(priceRequestModel);
    return response.prediction;
  }
}
