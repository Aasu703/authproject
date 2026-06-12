// lib/core/network/dio_client.dart
import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  // ignore: strict_top_level_inference
  DioClient(dioErrorBloc) : dio = Dio() {
    dio.options.connectTimeout = const Duration(seconds: 3);
    dio.options.receiveTimeout = const Duration(seconds: 3);
  }
}
