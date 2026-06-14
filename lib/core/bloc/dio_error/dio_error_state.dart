import 'package:equatable/equatable.dart';

class NetworkError extends Equatable {
  final String message;
  final String url;
  final String type;
  final DateTime timestamp;

  const NetworkError({
    required this.message,
    required this.url,
    required this.type,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [message, url, type, timestamp];
}

class DioErrorState extends Equatable {
  final List<NetworkError> errors;

  const DioErrorState({this.errors = const []});

  int get errorCount => errors.length;

  DioErrorState copyWith({List<NetworkError>? errors}) {
    return DioErrorState(errors: errors ?? this.errors);
  }

  @override
  List<Object?> get props => [errors];
}
