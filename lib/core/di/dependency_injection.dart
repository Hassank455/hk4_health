import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hk4_health/core/networking/api_service.dart';
import 'package:hk4_health/core/networking/dio_factory.dart';
import 'package:hk4_health/features/home/data/apis/home_api_service.dart';
import 'package:hk4_health/features/home/data/repos/home_repo.dart';
import 'package:hk4_health/features/login/data/repos/login_repo.dart';
import 'package:hk4_health/features/login/logic/cubit/login_cubit.dart';
import 'package:hk4_health/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:hk4_health/features/sign_up/logic/sign_up_cubit.dart';

//! important
// registerLazySingleton => create one instant and use it in all app
// registerFactory => every time we want to use it create new instant

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
