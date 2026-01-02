class LoginValidations {
  // Email validation
  static bool isValidEmail(String email) {
    if (email.isEmpty) return false;

    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    return emailRegex.hasMatch(email);
  }

  // Password validation
  static bool isValidPassword(String password) {
    if (password.isEmpty) return false;

    final passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$',
    );

    return passwordRegex.hasMatch(password);
  }
}
