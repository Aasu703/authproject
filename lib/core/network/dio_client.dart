// lib/core/network/dio_client.dart
import 'package:dio/dio.dart';
import '../bloc/dio_error/dio_error_bloc.dart';
import '../bloc/dio_error/dio_error_state.dart';

class DioClient {
  final Dio dio;
  final DioErrorBloc dioErrorBloc;

  DioClient(this.dioErrorBloc) : dio = Dio() {
    dio.options.connectTimeout = const Duration(seconds: 3);
    dio.options.receiveTimeout = const Duration(seconds: 3);

    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, handler) {
          dioErrorBloc.pushNetworkError(
            NetworkError(
              message: e.message ?? 'Unknown error',
              url: e.requestOptions.uri.toString(),
              type: e.type.toString(),
              timestamp: DateTime.now(),
            ),
          );
          return handler.next(e);
        },
      ),
    );
  }
}
