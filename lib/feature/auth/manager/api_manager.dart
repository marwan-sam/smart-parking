import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_parking/core/helper/shared_pref_helper.dart';
import 'package:smart_parking/core/helper/shared_pref_keys.dart';
import 'package:smart_parking/core/networking/api_const.dart';
import 'package:smart_parking/feature/auth/model/check%20code/check_code_request.dart';
import 'package:smart_parking/feature/auth/model/check%20code/check_code_responce.dart';
import 'package:smart_parking/feature/auth/model/forget%20pass/forget_password_request_model.dart';
import 'package:smart_parking/feature/auth/model/forget%20pass/forget_password_responce_model.dart';
import 'package:smart_parking/feature/auth/model/login/login_request_model.dart';
import 'package:smart_parking/feature/auth/model/login/login_respnoce_model.dart';
import 'package:smart_parking/feature/auth/model/price/price_request_model.dart';
import 'package:smart_parking/feature/auth/model/price/price_responce_model.dart';
import 'package:smart_parking/feature/auth/model/register/register_request_model.dart';
import 'package:smart_parking/feature/auth/model/register/register_responce_model.dart';
import 'package:smart_parking/feature/auth/model/reset%20by%20email/reset_by_email_request_model.dart';
import 'package:smart_parking/feature/auth/model/reset%20by%20email/reset_by_email_responce_model.dart';

class HttpClient {
  static Future<dynamic> post(String url, {Map? data}) async {
    return http.post(
      Uri.parse(url),
      body: data != null ? json.encode(data) : null,
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  static Future<dynamic> patch(String url, {Map? data}) async {
    return http.post(
      Uri.parse(url),
      body: data != null ? json.encode(data) : null,
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }
}

class ApiManager {
  /*
  preparing registerresponse function by handling (future await and async)
  sending ot's parameters and using URI 
  (uniform resource identifier which is responsible to get data from internet
    and calling api baseurl with endpoint in it's parameters )
    then saving registerrequest class ( json to dart and dart to json )
    and sending it's parameters 
  */
  Future<RegisterResponseModel> register(String name, String phone,
      String email, String password, String confirmPassword) async {
    Uri url = Uri.parse(ApiConst.baseUrl + ApiConst.signupUrl);
    var requestBody = RegisterRequestModel(
      name: name,
      password: password,
      email: email,
      confirmPassword: confirmPassword,
      phone: phone,
    );
    var response = await http.post(
      /*
      Using the required method POST to be saved in response variable 
      While we used  : Uri url = Uri.parse(ApiConstants.BaseURl + ApiConstants.SignupApi);
      we send it in post body and sending json decode 
      */
      url,
      body: json.encode(requestBody.toJson()),
      // as we recived data in row format we are using header to handle it
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final responseString = response.body;
    debugPrint('> path: ${url.toString()}');
    debugPrint('> body: ${requestBody.toJson()}');
    debugPrint('> response: [${response.statusCode}] $responseString');
    if (response.statusCode == 200) {
      // Successful response, parse the JSON
      var responseData = jsonDecode(responseString);
      return RegisterResponseModel.fromJson(responseData);
    } else if (response.statusCode == 400) {
      // Error response, parse the error message
      var responseData = jsonDecode(responseString);
      var errorMessage = responseData['message'];
      if (errorMessage == 'user already exist') {
        // Handle case where user already exists
        return RegisterResponseModel(message: 'User already exists');
      } else {
        // Handle other error messages
        return RegisterResponseModel(message: errorMessage);
      }
    } else {
      // Handle other status codes
      return RegisterResponseModel(message: 'Unexpected error occurred');
    }
  }

  Future<LoginResponseModel> login(String email, String password) async {
    var url = Uri.parse(ApiConst.baseUrl + ApiConst.loginUrl);
    var requestbody = LoginRequestModel(email: email, password: password);
    debugPrint('> path: ${url.toString()}');
    debugPrint('> body: ${requestbody.toJson()}');
    var response = await http.post(
      url,
      body: json.encode(requestbody.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    debugPrint('> response: [${response.statusCode}] ${response.body}');
    if (response.statusCode != 200) {
      throw Exception(
          jsonDecode(response.body)?['message'] ?? 'Error occurred!');
    }
    // ** Store Value of Email:
    SharedPrefHelper.setData(SharedPrefKeys.userEmail, email);
    return LoginResponseModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseCodeModel> resetByEmail(String email) async {
    var url = Uri.parse(ApiConst.baseUrl + ApiConst.sendCodeUrl);
    var requestbody = RequestCodeModel(email: email);
    debugPrint('> path: ${url.toString()}');
    debugPrint('> body: ${requestbody.toJson()}');
    var response = await http.patch(
      url,
      body: json.encode(requestbody.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    debugPrint('> response: [${response.statusCode}] ${response.body}');
    if (response.statusCode != 200) {
      throw Exception(
          jsonDecode(response.body)?['message'] ?? 'Error occurred!');
    }
    return ResponseCodeModel.fromJson(jsonDecode(response.body));
  }

  //Todo Editing Reciving Code CHecker
  Future<CodeCheckResponse> codeCheck(String error) async {
    var url = Uri.parse(ApiConst.baseUrl + ApiConst.checkresetcodeUrl);
    var requestbody = CodeCheckRequest(email: AutofillHints.email, code: error);
    debugPrint('> path: ${url.toString()}');
    debugPrint('> body: ${requestbody.toJson()}');

    var response = await http.patch(
      url,
      body: json.encode(requestbody.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    debugPrint('> response: [${response.statusCode}] ${response.body}');

    if (response.statusCode != 200) {
      throw Exception(
          jsonDecode(response.body)?['message'] ?? 'Error occurred!');
    }
    return CodeCheckResponse.fromJson(jsonDecode(response.body));
  }

  Future<ForgetPasswordResponseModel> forgetPassword(
      ForgetPasswordRequestModel forgetPasswordRequest) async {
    var url = Uri.parse(ApiConst.baseUrl + ApiConst.resetPasswordUrl);
    debugPrint('> path: ${url.toString()}');
    debugPrint('> body: ${forgetPasswordRequest.toJson()}');
    var response = await http.patch(
      url,
      body: json.encode(forgetPasswordRequest.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    debugPrint('> response: [${response.statusCode}] ${response.body}');
    if (response.statusCode != 200) {
      throw Exception(
          jsonDecode(response.body)?['message'] ?? 'Error occurred!');
    }

    return ForgetPasswordResponseModel.fromJson(jsonDecode(response.body));
  }

  Future<PriceResponseModel> price(PriceRequestModel priceRequestModel) async {
    var url = Uri.parse(ApiConst.predictPriceURl);
    debugPrint('> path: ${url.toString()}');
    var response = await http.post(
      url,
      body: json.encode(priceRequestModel.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    debugPrint('> response: [${response.statusCode}] ${response.body}');
    if (response.statusCode != 200) {
      throw Exception(
          jsonDecode(response.body)?['message'] ?? 'Error occurred!');
    }

    int hOUT = int.parse(priceRequestModel.hourOut ?? "");
    int hIN = int.parse(priceRequestModel.hourIn ?? "");

    debugPrint('> >>>>>> Time Rang = ${hOUT - hIN}');
    // ** GET ALL DETAILS FOR TICKECT:
    SharedPrefHelper.setData(
        SharedPrefKeys.ticketTimeHIN, priceRequestModel.hourIn);
    SharedPrefHelper.setData(
        SharedPrefKeys.ticketTimeHOUT, priceRequestModel.hourOut);
    SharedPrefHelper.setData(
        SharedPrefKeys.ticketTimeMIN, priceRequestModel.minuteIn);
    SharedPrefHelper.setData(
        SharedPrefKeys.ticketTimeMOUT, priceRequestModel.minuteOut);
    SharedPrefHelper.setData(
        SharedPrefKeys.ticketTimeDay, priceRequestModel.day);
    SharedPrefHelper.setData(
        SharedPrefKeys.ticketTimeMonth, priceRequestModel.month);

    var price = PriceResponseModel.fromJson(jsonDecode(response.body));
    SharedPrefHelper.setData(
        SharedPrefKeys.getPrice, price.prediction?.toInt());
    return price;
  }
}
