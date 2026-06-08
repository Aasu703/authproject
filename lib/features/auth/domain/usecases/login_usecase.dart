// lib/features/auth/domain/usecases/login_usecase.dart
import 'package:authproject/core/errors/failures.dart';
import 'package:authproject/core/usecases/usecase.dart';
import 'package:authproject/features/auth/domain/entities/auth_payload.dart';
import 'package:authproject/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginParams {
  final String email;
  final String passwordPlain;

  const LoginParams({required this.email, required this.passwordPlain});
}

class LoginUseCase
    implements UseCase<Either<Failure, AuthPayload>, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, AuthPayload>> call(LoginParams params) {
    return repository.login(
      email: params.email,
      passwordPlain: params.passwordPlain,
    );
  }
}
