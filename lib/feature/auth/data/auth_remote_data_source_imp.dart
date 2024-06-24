import 'package:smart_parking/feature/auth/manager/api_manager.dart';
import 'package:smart_parking/feature/auth/model/check%20code/check_code_responce.dart';
import 'package:smart_parking/feature/auth/model/forget%20pass/forget_password_request_model.dart';
import 'package:smart_parking/feature/auth/model/forget%20pass/forget_password_responce_model.dart';
import 'package:smart_parking/feature/auth/model/login/login_respnoce_model.dart';
import 'package:smart_parking/feature/auth/model/price/price_request_model.dart';
import 'package:smart_parking/feature/auth/model/price/price_responce_model.dart';
import 'package:smart_parking/feature/auth/model/register/register_responce_model.dart';
import 'package:smart_parking/feature/auth/model/reset%20by%20email/reset_by_email_responce_model.dart';
import 'package:smart_parking/feature/auth/repo/auth_repo_contract.dart';

//this class have  implentation of the methods in class AuthenticationRepositoryContract
class AuthRemoteDataSourceImpl implements AuthReomteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl(this.apiManager);
  @override
  Future<LoginResponseModel> login(String email, String password) async {
    var response = await apiManager.login(email, password);
    return response;
  }

  @override
  Future<RegisterResponseModel> register(String name, String phone,
      String email, String password, String confirmPassword) async {
    var response = await apiManager.register(
        name, phone, email, password, confirmPassword);
    return response;
  }

  @override
  Future<ForgetPasswordResponseModel> forgetPassword(
      ForgetPasswordRequestModel forgetPasswordRequest) async {
    var response = await apiManager.forgetPassword(forgetPasswordRequest);
    return response;
  }

  @override
  Future<ResponseCodeModel?> resetByEmail(email) async {
    var response = await apiManager.resetByEmail(email);
    return response;
  }

  @override
  Future<CodeCheckResponse?> codeCheck(String error) async {
    var response = await apiManager.codeCheck(error);
    return response;
  }

  @override
  Future<PriceResponseModel> price(PriceRequestModel priceRequestModel) async {
    var response = await apiManager.price(priceRequestModel);
    return response;
  }
}

//ToDo Function ResetPassword
//creating function named  injectAuthRemoteDataSource returning  AuthRemoteDataSourceImpl
AuthReomteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(injectApiManager());
}

ApiManager injectApiManager() {
  return ApiManager();

/*
class AuthReomteDataSource having special method of 
injectAuthRemoteDataSource return class AuthRemoteDataSourceImpl that have injectApiManager
what is injectApiManager ? 
it's a method created to call apimanger class methods 
*/
}
