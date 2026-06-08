import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:device_info_plus/device_info_plus.dart';

class AppConstants {
  AppConstants._();

  static const String appName = 'Auth Project';
  static const String tokenKey = 'jwt_token';

  static const String _localIp =
      '192.168.2.125'; // ← Update this IP when needed
  static const int _port = 3000;

  static Future<String> get _host async {
    if (kIsWeb) return 'localhost';

    if (Platform.isIOS) {
      final info = await DeviceInfoPlugin().iosInfo;
      return info.isPhysicalDevice ? _localIp : 'localhost';
    }

    if (Platform.isAndroid) {
      final info = await DeviceInfoPlugin().androidInfo;
      return info.isPhysicalDevice ? _localIp : '10.0.2.2';
    }

    return 'localhost';
  }

  static late final String graphqlBaseUrl;
  static late final String graphqlWsUrl;

  static Future<void> initialize() async {
    final host = await _host;
    graphqlBaseUrl = 'http://$host:$_port/graphql';
    graphqlWsUrl = 'ws://$host:$_port/graphql';
  }
}
