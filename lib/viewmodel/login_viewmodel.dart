import 'package:flutter/material.dart';
import '../services/auth_services.dart';
import '../validation/login_validation.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool isLoading = false;

  Future<String?> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return 'All fields are required';
    }

    if (!LoginValidations.isValidEmail(email)) {
      return 'Invalid email';
    }

    if (!LoginValidations.isValidPassword(password)) {
      return 'Invalid password';
    }

    isLoading = true;
    notifyListeners();

    final result = await _authService.login(
      email: email,
      password: password,
    );

    isLoading = false;
    notifyListeners();

    return result;
  }
}
