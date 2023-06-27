import 'package:firebase_auth/firebase_auth.dart';

class AuthResponse {
  final UserCredential? userCredential;
  final String? error;
  AuthResponse({
    this.userCredential,
    this.error,
  });
}
