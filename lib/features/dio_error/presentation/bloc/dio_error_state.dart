// lib/features/dio_error/presentation/bloc/dio_error_state.dart
import 'package:equatable/equatable.dart';

class DioErrorDetails extends Equatable {
  final String url;
  final String errorType;
  final String message;
  final int? statusCode;
  final DateTime timestamp;

  DioErrorDetails({
    required this.url,
    required this.errorType,
    required this.message,
    this.statusCode,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  @override
  List<Object?> get props => [url, errorType, message, statusCode, timestamp];
}

class DioErrorState extends Equatable {
  final List<DioErrorDetails> errors;

  const DioErrorState({required this.errors});

  factory DioErrorState.initial() => const DioErrorState(errors: []);

  int get errorCount => errors.length;

  DioErrorState copyWith({
    List<DioErrorDetails>? errors,
  }) {
    return DioErrorState(
      errors: errors ?? this.errors,
    );
  }

  @override
  List<Object?> get props => [errors];
}
