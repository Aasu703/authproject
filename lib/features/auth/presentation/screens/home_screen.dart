// lib/features/auth/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:authproject/injection_container.dart' as di;
import 'package:authproject/core/network/dio_client.dart';
import 'package:authproject/features/dio_error/presentation/widgets/dio_error_notification_badge.dart';
import 'package:authproject/features/dio_error/presentation/bloc/dio_error_bloc.dart';
import 'package:authproject/features/dio_error/presentation/bloc/dio_error_event.dart';
import '../bloc/auth_cubit.dart';
import '../bloc/auth_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E293B), // Dark slate dialog
          title: Text(
            tr('auth.logout_dialog_title'),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            tr('auth.logout_dialog_content'),
            style: const TextStyle(color: Colors.white70),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.white.withOpacity(0.1)),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(
                tr('auth.cancel'),
                style: const TextStyle(color: Color(0xFF94A3B8)),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.read<AuthCubit>().logoutRequested();
              },
              child: Text(
                tr('auth.logout'),
                style: const TextStyle(
                  color: Color(0xFFF43F5E), // Rose 500
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _trigger404(BuildContext context) async {
    try {
      final dioClient = di.sl<DioClient>();
      await dioClient.dio.get('https://httpbin.org/status/404');
    } catch (_) {}
  }

  void _trigger500(BuildContext context) async {
    try {
      final dioClient = di.sl<DioClient>();
      await dioClient.dio.get('https://httpbin.org/status/500');
    } catch (_) {}
  }

  void _triggerTimeout(BuildContext context) async {
    try {
      final dioClient = di.sl<DioClient>();
      await dioClient.dio.get(
        'https://10.255.255.1/timeout',
        options: Options(
          receiveTimeout: const Duration(milliseconds: 600),
          sendTimeout: const Duration(milliseconds: 600),
        ),
      );
    } catch (_) {}
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
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            // Language selector
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white24),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Locale>(
                  value: EasyLocalization.of(context)?.locale ?? context.locale,
                  dropdownColor: const Color(0xFF1E293B),
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white70,
                    size: 20,
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: Locale('en'),
                      child: Text('🇺🇸 EN'),
                    ),
                    DropdownMenuItem(
                      value: Locale('es'),
                      child: Text('🇪🇸 ES'),
                    ),
                  ],
                  onChanged: (locale) {
                    if (locale != null) {
                      EasyLocalization.of(context)?.setLocale(locale);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.logout_rounded, color: Color(0xFFF43F5E)),
              tooltip: tr('auth.logout'),
              onPressed: () => _showLogoutDialog(context),
            ),
            const SizedBox(width: 12),
          ],
        ),
        body: Stack(
          children: [
            // Dark Slate/Teal background gradient
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0F172A), // Slate 900
                    Color(0xFF1E293B), // Slate 800
                    Color(0xFF0F766E), // Teal 700
                  ],
                ),
              ),
            ),
            SafeArea(
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
                    final user = state.user;
                    final initial = user.email.isNotEmpty
                        ? user.email[0].toUpperCase()
                        : '?';

                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Profile Info Card
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 32,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.04),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.08),
                                width: 1.5,
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF2DD4BF),
                                        Color(0xFF0F766E),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      initial,
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  tr('dashboard.welcome_back'),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white.withOpacity(0.6),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  user.email,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Divider(color: Colors.white10),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.badge_outlined,
                                      color: Colors.white70,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${tr('dashboard.user_id')}: ${user.id}',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.white70,
                                        fontFamily: 'monospace',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton.icon(
                                  onPressed: () => context.push('/items'),
                                  icon: const Icon(Icons.list_alt_rounded),
                                  label: const Text('View Paginated List'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF2DD4BF),
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Dio Error Simulator Panel
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.04),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.08),
                                width: 1.5,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.network_check_rounded,
                                      color: Color(0xFF2DD4BF),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      tr('dio_error.simulator_title'),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  tr('dio_error.simulator_desc'),
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white.withOpacity(0.6),
                                    height: 1.4,
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // Error generation triggers
                                ElevatedButton.icon(
                                  onPressed: () => _triggerTimeout(context),
                                  icon: const Icon(Icons.timer_off_outlined),
                                  label: Text(tr('dio_error.trigger_timeout')),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white.withOpacity(
                                      0.06,
                                    ),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: const BorderSide(
                                        color: Colors.white12,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ElevatedButton.icon(
                                  onPressed: () => _trigger404(context),
                                  icon: const Icon(Icons.link_off_rounded),
                                  label: Text(tr('dio_error.trigger_404')),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white.withOpacity(
                                      0.06,
                                    ),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: const BorderSide(
                                        color: Colors.white12,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ElevatedButton.icon(
                                  onPressed: () => _trigger500(context),
                                  icon: const Icon(Icons.cloud_off_rounded),
                                  label: Text(tr('dio_error.trigger_500')),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white.withOpacity(
                                      0.06,
                                    ),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: const BorderSide(
                                        color: Colors.white12,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                // Clear logs button
                                TextButton.icon(
                                  onPressed: () => context
                                      .read<DioErrorBloc>()
                                      .add(ClearDioErrors()),
                                  icon: const Icon(Icons.clear_all_rounded),
                                  label: Text(tr('dio_error.clear_errors')),
                                  style: TextButton.styleFrom(
                                    foregroundColor: const Color(0xFF94A3B8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 48),
                        ],
                      ),
                    );
                  }

                  return Center(
                    child: Text(
                      tr('dashboard.session_expired'),
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
            // Floating Dio Error badge
            const DioErrorNotificationBadge(),
          ],
        ),
      ),
    );
  }
}
