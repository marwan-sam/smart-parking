import 'package:smart_parking/feature/auth/data/auth_remote_data_source_imp.dart';
import 'package:smart_parking/feature/auth/model/check%20code/check_code_responce.dart';
import 'package:smart_parking/feature/auth/model/forget%20pass/forget_password_responce_model.dart';
import 'package:smart_parking/feature/auth/model/price/price_responce_model.dart';
import 'package:smart_parking/feature/auth/model/reset%20by%20email/reset_by_email_responce_model.dart';
import 'package:smart_parking/feature/auth/model/forget%20pass/forget_password_request_model.dart';
import 'package:smart_parking/feature/auth/model/login/login_respnoce_model.dart';
import 'package:smart_parking/feature/auth/model/price/price_request_model.dart';
import 'package:smart_parking/feature/auth/model/register/register_responce_model.dart';
import 'package:smart_parking/feature/auth/repo/auth_repo_imp.dart';

abstract class AuthenticationRepositoryContract {
/*
Abstract class having methods and type of parameters w
 */
  Future<String?> register(String name, String phone, String email,
      String password, String confirmPassword);
  Future<String?> login(String email, String password);
  Future<String?> forgetPassword(
      ForgetPasswordRequestModel forgetPasswordRequest);
  Future<String?> resetByEmail(String email);
  Future<String?> codeCheck(String error);
  Future<double?> price(PriceRequestModel priceRequestModel);
}

// another abstarct calss preparing the data from model class
abstract class AuthReomteDataSource {
  Future<RegisterResponseModel> register(String name, String phone,
      String email, String password, String confirmPassword);
  Future<LoginResponseModel> login(String email, String password);
  Future<ResponseCodeModel?> resetByEmail(String email);
  Future<CodeCheckResponse?> codeCheck(String error);
  Future<ForgetPasswordResponseModel> forgetPassword(
      ForgetPasswordRequestModel forgetPasswordRequest);
  Future<PriceResponseModel> price(PriceRequestModel priceRequestModel);
}

AuthenticationRepositoryContract injectAuthRepository() {
  return AuthREpositoryImpl(injectAuthRemoteDataSource());

  /*
dependency injection : 
we made function named (injectAuthRepository) from class type AuthenticationRepositoryContract
return AuthREpositoryImpl ( which is have all implemintation of the methods )
and updated injectAuthRemoteDataSource 
بالبلدي بي retrun 
function that we did on class (AuthRemoteDataSourceImpl)
AuthReomteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(injectApiManager());
}
ApiManager injectApiManager() {
  return ApiManager();
}


*/
}
