import 'package:fluro/fluro.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../data/core/rest_client.dart';
import '../presentation/views/app/cubit/app_cubit.dart';
import '../presentation/views/sign_in/cubit/sign_in_cubit.dart';
import '../presentation/views/sign_up/cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

import '../data/data_sources/auth_data_source.dart';
import '../data/repositories/auth_repository.dart';
import '../data/core/constants.dart';
import '../domain/i_repositories/i_auth_repository.dart';
import '../domain/use_cases/login_with_credentials_use_case.dart';
import '../domain/use_cases/sign_up_user_use_case.dart';

final sl = GetIt.instance;

void configureInjection() {
  _setupDataDependencies();
  _setupRepository();
  _setupUseCases();
  _setupPresentationDependencies();
}

void _setupDataDependencies() {
  sl.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());
  sl.registerLazySingleton<IRestClient>(() => RestClient(baseApiUrl: Constants.baseApiUrl));
  sl.registerLazySingleton<IAuthDataSource>(() => AuthDataSource(sl<IRestClient>()));
}

void _setupRepository() {
  sl.registerFactory<IAuthRepository>(() => AuthRepository(sl<IAuthDataSource>()));
}

void _setupUseCases() {
  sl.registerFactory(() => LoginWithCredentialsUseCase(sl<IAuthRepository>()));
  sl.registerFactory(() => SignUpUserUseCase(sl<IAuthRepository>()));
}

void _setupPresentationDependencies() {
  sl.registerSingleton(FluroRouter());
  sl.registerSingleton(AppCubit());
  sl.registerFactory(() => SignInCubit(loginWithCredentialsUseCase: sl<LoginWithCredentialsUseCase>()));
  sl.registerFactory(() => SignUpCubit(signUpUserUseCase: sl<SignUpUserUseCase>()));
}
