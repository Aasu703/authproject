// lib/features/auth/domain/usecases/logout_usecase.dart
import 'package:authproject/core/usecases/usecase.dart';
import 'package:authproject/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase implements UseCase<void, NoParams> {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  @override
  Future<void> call(NoParams params) {
    return repository.logout();
  }
}
