// Flutter imports:
import 'package:flutter/material.dart';
import 'dart:convert';

// Project imports:
import 'package:mockapp/Constants/app_strings.dart';
import 'package:mockapp/Data/Authentication/password_reset.dart';
import 'package:mockapp/Utils/authentication_status.dart';
import 'package:mockapp/Utils/json_detector.dart';

class PasswordResetProvider with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.waitting;

  late String oldPassword;
  late String newPassword;
  late String confirmPassword;

  String errorMessage = "";
  String successMessage = "";

  passwordReset() async {
    loadingStatus = LoadingStatus.started;
    var response = await PasswordResetApi().passwordReset(dataOrganizer());
    if (response['success'] == true) {
      successMessage = AppStrings.successMessage;
      loadingStatus = LoadingStatus.finished;
      notifyListeners();
    } else {
      errorMessage = isJson(response['data'])
          ? json.decode(response['data'])
          : response['data'];
      loadingStatus = LoadingStatus.finished;
      notifyListeners();
    }
  }

  resetMessages() {
    errorMessage = "";
    successMessage = "";
    notifyListeners();
  }

  Map<String, dynamic> dataOrganizer() {
    return {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
      "confirmPassword": confirmPassword
    };
  }
}
