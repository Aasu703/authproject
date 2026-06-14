// lib/injection_container.dart
import 'package:authproject/core/bloc/dio_error/dio_error_bloc.dart';
import 'package:authproject/core/network/dio_client.dart';
import 'package:authproject/core/network/graphql_client_factory.dart';
import 'package:authproject/core/router/router.dart';
import 'package:authproject/core/services/token_service.dart';
import 'package:authproject/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:authproject/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:authproject/features/auth/domain/repositories/auth_repository.dart';
import 'package:authproject/features/auth/domain/usecases/get_me_usecase.dart';
import 'package:authproject/features/auth/domain/usecases/login_usecase.dart';
import 'package:authproject/features/auth/domain/usecases/logout_usecase.dart';
import 'package:authproject/features/auth/domain/usecases/register_usecase.dart';
import 'package:authproject/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:authproject/features/items/data/datasources/item_remote_datasource.dart';
import 'package:authproject/features/items/data/repositories/item_repository_impl.dart';
import 'package:authproject/features/items/domain/repositories/item_repository.dart';
import 'package:authproject/features/items/domain/usecases/get_items_usecase.dart';
import 'package:authproject/features/items/presentation/bloc/item_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);

  sl.registerLazySingleton<DioErrorBloc>(() => DioErrorBloc());
  sl.registerLazySingleton<DioClient>(() => DioClient(sl<DioErrorBloc>()));

  sl.registerLazySingleton<TokenService>(
    () => TokenService(sl<SharedPreferences>()),
  );
  sl.registerLazySingleton<GraphQLClient>(
    () => GraphQLClientFactory(sl<TokenService>()).create(),
  );

  // Items Feature
  sl.registerLazySingleton<ItemRemoteDataSource>(
    () => ItemRemoteDataSourceImpl(client: sl<GraphQLClient>()),
  );
  sl.registerLazySingleton<ItemRepository>(
    () => ItemRepositoryImpl(remoteDataSource: sl<ItemRemoteDataSource>()),
  );
  sl.registerLazySingleton(() => GetItemsUseCase(sl<ItemRepository>()));
  sl.registerFactory(() => ItemBloc(getItemsUseCase: sl<GetItemsUseCase>()));

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

  sl.registerLazySingleton(
    () => AuthCubit(
      loginUseCase: sl<LoginUseCase>(),
      registerUseCase: sl<RegisterUseCase>(),
      getMeUseCase: sl<GetMeUseCase>(),
      logoutUseCase: sl<LogoutUseCase>(),
    ),
  );

  sl.registerLazySingleton(() => AppRouter(sl<AuthCubit>()));
}
