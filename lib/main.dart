// lib/main.dart
import 'package:authproject/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'injection_container.dart' as di;
import 'core/constants/app_constants.dart'; // ← Add this import

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize URLs first (very important)
  await AppConstants.initialize();

  // Then initialize dependencies
  await di.initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => di.sl<AuthBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Auth Project',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0F766E)),
          scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
