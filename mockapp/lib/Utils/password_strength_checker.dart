class PasswordStrengthCheker {
  static bool isStrongPassword(String password) {
    var hasLetters = password.contains(RegExp(r'[a-zA-Z]'));
    var hasMinLength = password.length >= 8;
    return hasLetters && hasMinLength;
  }
}
