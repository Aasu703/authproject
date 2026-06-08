// lib/core/services/token_service.dart
import 'package:authproject/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  final SharedPreferences sharedPreferences;

  TokenService(this.sharedPreferences);

  Future<void> saveToken(String token) async {
    await sharedPreferences.setString(AppConstants.tokenKey, token);
  }

  Future<String?> getToken() async {
    return sharedPreferences.getString(AppConstants.tokenKey);
  }

  Future<void> clearToken() async {
    await sharedPreferences.remove(AppConstants.tokenKey);
  }
}
