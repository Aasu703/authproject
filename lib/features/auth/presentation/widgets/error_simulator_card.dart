import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dio/dio.dart';
import 'package:authproject/injection_container.dart' as di;
import 'package:authproject/core/network/dio_client.dart';

class ErrorSimulatorCard extends StatelessWidget {
  const ErrorSimulatorCard({super.key});

  void _trigger404() async {
    try {
      final dioClient = di.sl<DioClient>();
      await dioClient.dio.get('https://httpbin.org/status/404');
    } catch (_) {}
  }

  void _trigger500() async {
    try {
      final dioClient = di.sl<DioClient>();
      await dioClient.dio.get('https://httpbin.org/status/500');
    } catch (_) {}
  }

  void _triggerTimeout() async {
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
    return Container(
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
              const Icon(Icons.bug_report_outlined, color: Color(0xFF2DD4BF)),
              const SizedBox(width: 12),
              Text(
                tr('dio_error.simulator_title'),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            tr('dio_error.simulator_desc'),
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _ErrorButton(
                onPressed: _triggerTimeout,
                label: tr('dio_error.trigger_timeout'),
                icon: Icons.timer_outlined,
              ),
              _ErrorButton(
                onPressed: _trigger404,
                label: tr('dio_error.trigger_404'),
                icon: Icons.find_in_page_outlined,
              ),
              _ErrorButton(
                onPressed: _trigger500,
                label: tr('dio_error.trigger_500'),
                icon: Icons.dns_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ErrorButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData icon;

  const _ErrorButton({
    required this.onPressed,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 16),
      label: Text(label, style: const TextStyle(fontSize: 11)),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white70,
        side: BorderSide(color: Colors.white.withOpacity(0.1)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}
