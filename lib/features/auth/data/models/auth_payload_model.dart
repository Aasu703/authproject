// lib/features/auth/data/models/auth_payload_model.dart
import 'package:authproject/features/auth/data/models/user_model.dart';
import 'package:authproject/features/auth/domain/entities/auth_payload.dart';

class AuthPayloadModel extends AuthPayload {
  const AuthPayloadModel({required super.token, required super.user});

  factory AuthPayloadModel.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'];
    return AuthPayloadModel(
      token: json['token']?.toString() ?? '',
      user: UserModel.fromJson(Map<String, dynamic>.from(userJson as Map)),
    );
  }
}
