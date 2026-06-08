// lib/features/auth/domain/entities/user.dart
class User {
  final String id;
  final String email;

  const User({required this.id, required this.email});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is User && other.id == id && other.email == email;
  }

  @override
  int get hashCode => Object.hash(id, email);
}
