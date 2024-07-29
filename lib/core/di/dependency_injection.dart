import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networking/api_service.dart';
import 'package:flutter_complete_project/core/networking/dio_factory.dart';
import 'package:flutter_complete_project/features/login/data/repos/login_repo.dart';
import 'package:flutter_complete_project/features/login/logic/login_cubit.dart';
import 'package:flutter_complete_project/features/sign%20up/data/repos/sign_up_repo.dart';
import 'package:flutter_complete_project/features/sign%20up/logic/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // Login
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  // SignUp
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));

  // Home
}
