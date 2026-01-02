import 'package:flutter/material.dart';
import '../services/auth_services.dart';
import '../validation/register_validation.dart';

class RegisterViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool isLoading = false;

  Future<String?> register(
      String name,
      String email,
      String password,
      String confirmPassword,
      ) async {
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      return 'All fields are required';
    }

    if (!RegisterValidation.isValidEmail(email)) {
      return 'Invalid email';
    }

    if (!RegisterValidation.isValidPassword(password)) {
      return 'Weak password';
    }

    if (password != confirmPassword) {
      return 'Passwords do not match';
    }

    isLoading = true;
    notifyListeners();

    final result = await _authService.register(
      email: email,
      password: password,
    );

    isLoading = false;
    notifyListeners();

    return result;
  }
}
