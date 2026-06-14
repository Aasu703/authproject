import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
    );
  }
}
