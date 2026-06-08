// lib/features/auth/data/repositories/auth_repository_impl.dart
import 'package:authproject/core/errors/failures.dart';
import 'package:authproject/core/services/token_service.dart';
import 'package:authproject/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:authproject/features/auth/domain/entities/auth_payload.dart';
import 'package:authproject/features/auth/domain/entities/user.dart';
import 'package:authproject/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final TokenService tokenService;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.tokenService,
  });

  @override
  Future<Either<Failure, AuthPayload>> login({
    required String email,
    required String passwordPlain,
  }) async {
    try {
      final payload = await remoteDataSource.login(
        email: email,
        passwordPlain: passwordPlain,
      );
      await tokenService.saveToken(payload.token);
      return Right(payload);
    } catch (error) {
      return Left(ServerFailure(_resolveFailureMessage(error)));
    }
  }

  @override
  Future<Either<Failure, AuthPayload>> register({
    required String email,
    required String passwordPlain,
  }) async {
    try {
      final payload = await remoteDataSource.register(
        email: email,
        passwordPlain: passwordPlain,
      );
      await tokenService.saveToken(payload.token);
      return Right(payload);
    } catch (error) {
      return Left(ServerFailure(_resolveFailureMessage(error)));
    }
  }

  @override
  Future<Either<Failure, User>> getMe() async {
    try {
      final token = await tokenService.getToken();
      if (token == null || token.isEmpty) {
        return const Left(CacheFailure('No authentication token found'));
      }

      final user = await remoteDataSource.getMe();
      return Right(user);
    } catch (error) {
      return Left(ServerFailure(_resolveFailureMessage(error)));
    }
  }

  @override
  Future<void> logout() async {
    await tokenService.clearToken();
  }

  String _resolveFailureMessage(Object error) {
    final message = error.toString();
    if (message.startsWith('Exception: ')) {
      return message.replaceFirst('Exception: ', '');
    }
    return message;
  }
}
