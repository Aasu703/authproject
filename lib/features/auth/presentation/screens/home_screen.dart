// lib/features/auth/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../core/widgets/auth_background.dart';
import '../../../../core/widgets/language_selector.dart';
import '../bloc/auth_cubit.dart';
import '../bloc/auth_state.dart';
import '../widgets/logout_dialog.dart';
import '../widgets/user_profile_card.dart';
import '../widgets/error_simulator_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => const LogoutDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        // Auth redirection is handled by GoRouter
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            tr('dashboard.title'),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            const LanguageSelector(),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.logout_rounded, color: Color(0xFFF43F5E)),
              tooltip: tr('auth.logout'),
              onPressed: () => _showLogoutDialog(context),
            ),
            const SizedBox(width: 12),
          ],
        ),
        body: AuthBackground(
          child: SafeArea(
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF2DD4BF),
                      ),
                    ),
                  );
                }

                if (state is Authenticated) {
                  return AnimationLimiter(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 500),
                          childAnimationBuilder: (widget) => SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(child: widget),
                          ),
                          children: [
                            UserProfileCard(user: state.user),
                            const SizedBox(height: 24),
                            const ErrorSimulatorCard(),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                return Center(
                  child: Text(
                    tr('dashboard.session_expired'),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
