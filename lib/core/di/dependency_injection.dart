import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hk4_health/core/networking/api_service.dart';
import 'package:hk4_health/core/networking/dio_factory.dart';
import 'package:hk4_health/features/login/data/repos/login_repo.dart';
import 'package:hk4_health/features/login/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  // getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  // getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}