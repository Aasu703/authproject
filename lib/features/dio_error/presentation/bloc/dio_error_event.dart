// lib/features/dio_error/presentation/bloc/dio_error_event.dart
import 'package:equatable/equatable.dart';

abstract class DioErrorEvent extends Equatable {
  const DioErrorEvent();

  @override
  List<Object?> get props => [];
}

class AddDioError extends DioErrorEvent {
  final String url;
  final String errorType;
  final String message;
  final int? statusCode;

  const AddDioError({
    required this.url,
    required this.errorType,
    required this.message,
    this.statusCode,
  });

  @override
  List<Object?> get props => [url, errorType, message, statusCode];
}

class ClearDioErrors extends DioErrorEvent {}
