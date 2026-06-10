// lib/features/dio_error/presentation/widgets/dio_error_notification_badge.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../bloc/dio_error_bloc.dart';
import '../bloc/dio_error_event.dart';
import '../bloc/dio_error_state.dart';

class DioErrorNotificationBadge extends StatelessWidget {
  const DioErrorNotificationBadge({super.key});

  void _showErrorDetailsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) {
        return BlocBuilder<DioErrorBloc, DioErrorState>(
          bloc: context.read<DioErrorBloc>(),
          builder: (context, state) {
            return Container(
              height: MediaQuery.of(modalContext).size.height * 0.75,
              decoration: const BoxDecoration(
                color: Color(0xFF0F172A), // Slate 900
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                border: Border(
                  top: BorderSide(color: Color(0xFF334155), width: 1.5),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    // Handle Bar
                    const SizedBox(height: 12),
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFF475569),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.bug_report_rounded,
                                color: Color(0xFFF43F5E), // Rose 500
                              ),
                              const SizedBox(width: 8),
                              Text(
                                tr('dio_error.details_title'),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete_sweep_rounded,
                              color: Color(0xFF94A3B8),
                            ),
                            tooltip: tr('dio_error.clear_errors'),
                            onPressed: () {
                              context.read<DioErrorBloc>().add(ClearDioErrors());
                              Navigator.of(modalContext).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Divider(color: Color(0xFF1E293B)),
                    // List
                    Expanded(
                      child: state.errors.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.cloud_done_rounded,
                                    size: 64,
                                    color: Color(0xFF10B981), // Emerald 500
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    tr('dio_error.no_errors'),
                                    style: const TextStyle(
                                      color: Color(0xFF94A3B8),
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.all(16),
                              itemCount: state.errors.length,
                              itemBuilder: (context, index) {
                                final error = state.errors[index];
                                final timeStr = DateFormat('HH:mm:ss').format(error.timestamp);
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1E293B), // Slate 800
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: const Color(0xFFEF4444).withOpacity(0.2),
                                    ),
                                  ),
                                  child: ExpansionTile(
                                    iconColor: const Color(0xFFF43F5E),
                                    collapsedIconColor: const Color(0xFF94A3B8),
                                    title: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFEF4444).withOpacity(0.15),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            error.statusCode != null
                                                ? '${error.statusCode}'
                                                : 'ERR',
                                            style: const TextStyle(
                                              color: Color(0xFFF43F5E),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            error.url.split('/').last.isEmpty
                                                ? error.url
                                                : error.url.split('/').last,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    subtitle: Text(
                                      '${tr('dio_error.timestamp')}: $timeStr',
                                      style: TextStyle(
                                        color: const Color(0xFF94A3B8).withOpacity(0.7),
                                        fontSize: 11,
                                      ),
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Divider(color: Color(0xFF334155)),
                                            const SizedBox(height: 8),
                                            _buildErrorDetailRow(
                                              tr('dio_error.url'),
                                              error.url,
                                            ),
                                            const SizedBox(height: 8),
                                            _buildErrorDetailRow(
                                              tr('dio_error.type'),
                                              error.errorType,
                                            ),
                                            const SizedBox(height: 8),
                                            _buildErrorDetailRow(
                                              tr('dio_error.message'),
                                              error.message,
                                              isHighlight: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildErrorDetailRow(String label, String value, {bool isHighlight = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: Color(0xFF64748B),
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: isHighlight ? const Color(0xFFFDA4AF) : const Color(0xFFCBD5E1),
            fontSize: 13,
            fontFamily: 'monospace',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DioErrorBloc, DioErrorState>(
      builder: (context, state) {
        if (state.errorCount == 0) {
          return const SizedBox.shrink();
        }

        return Positioned(
          bottom: 24,
          right: 24,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => _showErrorDetailsBottomSheet(context),
              borderRadius: BorderRadius.circular(30),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFEF4444).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFEF4444).withOpacity(0.4),
                      blurRadius: 16,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(
                    color: const Color(0xFFFECACA).withOpacity(0.4),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      tr('dio_error.errors_pending', args: [state.errorCount.toString()]),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
