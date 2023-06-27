import 'package:fixia_app/repository/auth_repository.dart';
import 'package:fixia_app/routes/routes_name.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepository authRepository = AuthRepository();
  void createUser(BuildContext context,
      {required emailAddress, required password}) async {
    print('$emailAddress,$password');
    final response = await authRepository.createUser(emailAddress, password);

    if (response.userCredential != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        homeRoute,
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Email already in use"),
      ));
    }
  }

  void loginUser(BuildContext context,
      {required logEmail, required logPassword}) async {
    final response = await authRepository.loginUser(logEmail, logPassword);
    if (response.userCredential != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        homeRoute,
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("user not found"),
      ));
    }
  }

  void signOutUSer(BuildContext context) async {
    final response = await authRepository.signOut();
    if (response.userCredential != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        authRoute,
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("user not found"),
      ));
    }
  }
}
