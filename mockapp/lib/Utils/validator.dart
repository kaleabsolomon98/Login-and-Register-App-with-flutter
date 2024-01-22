// Project imports:
import 'package:mockapp/Constants/app_strings.dart';
import 'package:mockapp/Utils/app_regexp.dart';
import 'package:mockapp/Utils/password_strength_checker.dart';

passwordValidator(String value) {
  return value.isEmpty
      ? AppStrings.pleaseEnterPassword
      : PasswordStrengthCheker.isStrongPassword(value)
          ? null
          : AppStrings.invalidPassword;
}

confirmPasswordValidator(String value, password, confirmPassword) {
  return value.isEmpty
      ? AppStrings.pleaseReEnterPassword
      : PasswordStrengthCheker.isStrongPassword(value)
          ? password == confirmPassword
              ? null
              : AppStrings.passwordNotMatched
          : AppStrings.invalidPassword;
}

emailValidator(String value) {
  return value.isEmpty
      ? AppStrings.pleaseEnterEmailAddress
      : emailRegex.hasMatch(value)
          ? null
          : AppStrings.invalidEmailAddress;
}

firstNameValidator(String value) {
  return value.isEmpty
      ? AppStrings.pleaseEnterFirstName
      : value.length < 4
          ? AppStrings.invalidName
          : null;
}

lastNameValidator(String value) {
  return value.isEmpty
      ? AppStrings.pleaseEnterLastName
      : value.length < 4
          ? AppStrings.invalidName
          : null;
}
