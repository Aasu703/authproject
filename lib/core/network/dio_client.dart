// lib/core/network/dio_client.dart
import 'package:dio/dio.dart';
import 'package:authproject/features/dio_error/presentation/bloc/dio_error_bloc.dart';
import 'package:authproject/features/dio_error/presentation/bloc/dio_error_event.dart';

class DioErrorInterceptor extends Interceptor {
  final DioErrorBloc dioErrorBloc;

  DioErrorInterceptor(this.dioErrorBloc);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    dioErrorBloc.add(
      AddDioError(
        url: err.requestOptions.uri.toString(),
        errorType: err.type.name,
        message: err.message ?? 'Unknown network error occurred',
        statusCode: err.response?.statusCode,
      ),
    );
    super.onError(err, handler);
  }
}

class DioClient {
  final Dio dio;

  DioClient(DioErrorBloc dioErrorBloc) : dio = Dio() {
    dio.options.connectTimeout = const Duration(seconds: 3);
    dio.options.receiveTimeout = const Duration(seconds: 3);
    dio.interceptors.add(DioErrorInterceptor(dioErrorBloc));
  }
}
