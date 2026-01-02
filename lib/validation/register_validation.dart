class RegisterValidation {
  static bool isValidEmail(String email) {
    return RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return RegExp(
      r'^(?=.*[A-Z])(?=.*[@#$%^&+=!]).{8,}$',
    ).hasMatch(password);
  }

  static bool isPasswordMatch(String pass, String confirmPass) {
    return pass == confirmPass;
  }
}
