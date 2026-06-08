// lib/features/auth/domain/usecases/get_me_usecase.dart
import 'package:authproject/core/errors/failures.dart';
import 'package:authproject/core/usecases/usecase.dart';
import 'package:authproject/features/auth/domain/entities/user.dart';
import 'package:authproject/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class GetMeUseCase implements UseCase<Either<Failure, User>, NoParams> {
  final AuthRepository repository;

  GetMeUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) {
    return repository.getMe();
  }
}
