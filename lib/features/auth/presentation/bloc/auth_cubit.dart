// lib/features/auth/presentation/bloc/auth_cubit.dart
import 'package:authproject/core/usecases/usecase.dart';
import 'package:authproject/features/auth/domain/usecases/get_me_usecase.dart';
import 'package:authproject/features/auth/domain/usecases/login_usecase.dart';
import 'package:authproject/features/auth/domain/usecases/logout_usecase.dart';
import 'package:authproject/features/auth/domain/usecases/register_usecase.dart';
import 'package:authproject/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final GetMeUseCase getMeUseCase;
  final LogoutUseCase logoutUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.getMeUseCase,
    required this.logoutUseCase,
  }) : super(AuthInitial());

  Future<void> appStarted() async {
    emit(AuthLoading());
    final result = await getMeUseCase(const NoParams());
    result.fold(
      (failure) => emit(Unauthenticated()),
      (user) => emit(Authenticated(user)),
    );
  }

  Future<void> loginRequested({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await loginUseCase(
      LoginParams(email: email, passwordPlain: password),
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (authPayload) => emit(Authenticated(authPayload.user)),
    );
  }

  Future<void> registerRequested({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await registerUseCase(
      RegisterParams(email: email, passwordPlain: password),
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (authPayload) => emit(Authenticated(authPayload.user)),
    );
  }

  Future<void> logoutRequested() async {
    emit(AuthLoading());
    await logoutUseCase(const NoParams());
    emit(Unauthenticated());
  }
}
