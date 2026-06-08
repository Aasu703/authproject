// lib/features/auth/domain/repositories/auth_repository.dart
import 'package:authproject/core/errors/failures.dart';
import 'package:authproject/features/auth/domain/entities/auth_payload.dart';
import 'package:authproject/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthPayload>> login({
    required String email,
    required String passwordPlain,
  });

  Future<Either<Failure, AuthPayload>> register({
    required String email,
    required String passwordPlain,
  });

  Future<Either<Failure, User>> getMe();

  Future<void> logout();
}
