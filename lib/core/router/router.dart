import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:authproject/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:authproject/features/auth/presentation/bloc/auth_state.dart';
import 'package:authproject/features/auth/presentation/screens/home_screen.dart';
import 'package:authproject/features/auth/presentation/screens/login_screen.dart';
import 'package:authproject/features/auth/presentation/screens/register_screen.dart';
import 'package:authproject/features/auth/presentation/screens/splash_screen.dart';
import 'package:authproject/features/items/presentation/bloc/item_bloc.dart';
import 'package:authproject/features/items/presentation/screens/item_list_screen.dart';
import 'package:authproject/injection_container.dart' as di;

class AppRouter {
  final AuthCubit authCubit;

  AppRouter(this.authCubit);

  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
    redirect: (context, state) {
      final authState = authCubit.state;
      final bool loggingIn =
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/register';

      if (authState is AuthInitial || authState is AuthLoading) {
        return null;
      }

      if (authState is Unauthenticated) {
        return loggingIn ? null : '/login';
      }

      if (authState is Authenticated) {
        if (loggingIn || state.matchedLocation == '/') {
          return '/home';
        }
      }

      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/items',
        builder: (context, state) => BlocProvider(
          create: (_) => di.sl<ItemBloc>()..add(FetchItems()),
          child: const ItemListScreen(),
        ),
      ),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
