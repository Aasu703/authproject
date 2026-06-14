import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_cubit.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF1E293B),
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
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            tr('auth.cancel'),
            style: const TextStyle(color: Color(0xFF94A3B8)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            context.read<AuthCubit>().logoutRequested();
          },
          child: Text(
            tr('auth.logout'),
            style: const TextStyle(
              color: Color(0xFFF43F5E),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
