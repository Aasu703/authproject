// lib/features/auth/domain/entities/auth_payload.dart
import 'package:authproject/features/auth/domain/entities/user.dart';

class AuthPayload {
  final String token;
  final User user;

  const AuthPayload({required this.token, required this.user});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is AuthPayload && other.token == token && other.user == user;
  }

  @override
  int get hashCode => Object.hash(token, user);
}
