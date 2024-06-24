/// * api constant strings like "base url , .."
class ApiConst {
  static const String baseUrl = "http://smrt-parking.tech/api/v1/";

  // * FOR BOOKING
  static const String predictPriceURl =
      'https://smart-parking-smartparking-1d8ef0a1.koyeb.app/predict';

  // * FOR USER
  static const String signupUrl = "user/signup";
  static const String loginUrl = "user/signin";
  static const String sendCodeUrl = "user/sendCode";
  static const String checkresetcodeUrl = "user/checkresetcode";
  static const String resetPasswordUrl = "user/resetPassword";
  static const String changePasswordUrl = "user/changepassword";
  static const String logoutUrl = "user/logout";
  //static const String userInfotUrl = "user/userInfo";
}

/// * api error constant strings like "ok, bad request error"
class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
