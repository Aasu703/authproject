// lib/features/auth/presentation/bloc/auth_bloc.dart
import 'package:authproject/core/usecases/usecase.dart';
import 'package:authproject/features/auth/domain/usecases/get_me_usecase.dart';
import 'package:authproject/features/auth/domain/usecases/login_usecase.dart';
import 'package:authproject/features/auth/domain/usecases/logout_usecase.dart';
import 'package:authproject/features/auth/domain/usecases/register_usecase.dart';
import 'package:authproject/features/auth/presentation/bloc/auth_event.dart';
import 'package:authproject/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final GetMeUseCase getMeUseCase;
  final LogoutUseCase logoutUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.getMeUseCase,
    required this.logoutUseCase,
  }) : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onAppStarted(
    AppStarted event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await getMeUseCase(const NoParams());
    result.fold(
      (failure) => emit(Unauthenticated()),
      (user) => emit(Authenticated(user)),
    );
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await loginUseCase(
      LoginParams(email: event.email, passwordPlain: event.password),
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (authPayload) => emit(Authenticated(authPayload.user)),
    );
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await registerUseCase(
      RegisterParams(email: event.email, passwordPlain: event.password),
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (authPayload) => emit(Authenticated(authPayload.user)),
    );
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    await logoutUseCase(const NoParams());
    emit(Unauthenticated());
  }
}
