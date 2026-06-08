// lib/features/auth/domain/usecases/register_usecase.dart
import 'package:authproject/core/errors/failures.dart';
import 'package:authproject/core/usecases/usecase.dart';
import 'package:authproject/features/auth/domain/entities/auth_payload.dart';
import 'package:authproject/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterParams {
  final String email;
  final String passwordPlain;

  const RegisterParams({required this.email, required this.passwordPlain});
}

class RegisterUseCase
    implements UseCase<Either<Failure, AuthPayload>, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, AuthPayload>> call(RegisterParams params) {
    return repository.register(
      email: params.email,
      passwordPlain: params.passwordPlain,
    );
  }
}
