import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_parking/core/networking/api_service.dart';
import 'package:smart_parking/core/networking/dio_factory.dart';
import 'package:smart_parking/feature/setting/change_password/data/repo/change_password_repo.dart';
import 'package:smart_parking/feature/setting/change_password/logic/change_password_cubit.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  //LINK @ DIO & API services :
  Dio dio =
      DioFactory.getDio(); //REVIEW - cuz i need it for passing in api service
  getIt.registerLazySingleton<ApiService>(() =>
      ApiService(dio)); //ANCHOR -> get it for shareing api service as DI FOR :

  //LINK @ change password
  getIt.registerLazySingleton<ChangePasswordRepo>(
      () => ChangePasswordRepo(getIt()));
  getIt
      .registerFactory<ChangePasswordCubit>(() => ChangePasswordCubit(getIt()));

  //LINK @ show profile info (in settings view)

  //LINK @ logout

  //LINK @ Payment:
  // Dio stripeDio = DioFactory.getDio();
  // stripeDio.options.headers['Authorization'] = 'Bearer ${KeyAPIStripe.secret}';
  // getIt.registerLazySingleton<StripeService>(() => StripeService(stripeDio));
  // Register ApiService
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
}
