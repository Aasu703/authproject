import 'package:authproject/core/bloc/dio_error/dio_error_bloc.dart';
import 'package:authproject/core/bloc/dio_error/dio_error_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class DioErrorBadge extends StatelessWidget {
  const DioErrorBadge({super.key});

  void _showErrorDetails(BuildContext context, List<NetworkError> errors) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E293B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr('dio_error.details_title'),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<DioErrorBloc>().clearErrors();
                        Navigator.pop(context);
                      },
                      child: Text(tr('dio_error.clear_errors')),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: errors.length,
                  itemBuilder: (context, index) {
                    final error = errors[index];
                    return ListTile(
                      title: Text(
                        error.message,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '${error.type} - ${error.url}',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      trailing: Text(
                        DateFormat('HH:mm:ss').format(error.timestamp),
                        style: const TextStyle(color: Colors.white30),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DioErrorBloc, DioErrorState>(
      builder: (context, state) {
        if (state.errorCount == 0) return const SizedBox.shrink();

        return Positioned(
          bottom: 20,
          right: 20,
          child: GestureDetector(
            onTap: () => _showErrorDetails(context, state.errors),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFEF4444),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.warning_amber_rounded, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    tr(
                      'dio_error.errors_pending',
                      args: [state.errorCount.toString()],
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
