// lib/injection_container.dart
import 'package:authproject/core/network/graphql_client_factory.dart';
import 'package:authproject/core/services/token_service.dart';
import 'package:authproject/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:authproject/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:authproject/features/auth/domain/repositories/auth_repository.dart';
import 'package:authproject/features/auth/domain/usecases/get_me_usecase.dart';
import 'package:authproject/features/auth/domain/usecases/login_usecase.dart';
import 'package:authproject/features/auth/domain/usecases/logout_usecase.dart';
import 'package:authproject/features/auth/domain/usecases/register_usecase.dart';
import 'package:authproject/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);

  sl.registerLazySingleton<TokenService>(
    () => TokenService(sl<SharedPreferences>()),
  );
  sl.registerLazySingleton<GraphQLClient>(
    () => GraphQLClientFactory(sl<TokenService>()).create(),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl<GraphQLClient>()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl<AuthRemoteDataSource>(),
      tokenService: sl<TokenService>(),
    ),
  );

  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => RegisterUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => GetMeUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => LogoutUseCase(sl<AuthRepository>()));

  sl.registerFactory(
    () => AuthBloc(
      loginUseCase: sl<LoginUseCase>(),
      registerUseCase: sl<RegisterUseCase>(),
      getMeUseCase: sl<GetMeUseCase>(),
      logoutUseCase: sl<LogoutUseCase>(),
    ),
  );
}
