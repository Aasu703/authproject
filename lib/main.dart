// lib/main.dart
import 'package:authproject/core/bloc/dio_error/dio_error_bloc.dart';
import 'package:authproject/core/widgets/dio_error_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:authproject/core/router/router.dart';

import 'features/auth/presentation/bloc/auth_cubit.dart';
import 'injection_container.dart' as di;
import 'core/constants/app_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize EasyLocalization
  await EasyLocalization.ensureInitialized();

  // Initialize URLs first (very important)
  await AppConstants.initialize();

  // Then initialize dependencies
  await di.initDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('es')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => di.sl<AuthCubit>()),
        BlocProvider<DioErrorBloc>(create: (_) => di.sl<DioErrorBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Auth Project',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0F766E)),
          scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        ),
        routerConfig: di.sl<AppRouter>().router,
        builder: (context, child) {
          return Stack(
            children: [
              if (child != null) child,
              const DioErrorBadge(),
            ],
          );
        },
      ),
    );
  }
}
