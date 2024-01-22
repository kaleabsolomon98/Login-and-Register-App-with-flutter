// Flutter imports:
import 'package:flutter/material.dart';
import 'dart:convert';

// Project imports:
import 'package:mockapp/Data/registration.dart';
import 'package:mockapp/Utils/authentication_status.dart';
import 'package:mockapp/Utils/json_detector.dart';

class RegisterProvider with ChangeNotifier {
  RegistrationStatusEnum registrationStatus = RegistrationStatusEnum.login;
  LoadingStatus loadingStatus = LoadingStatus.waitting;

  late String firstName;
  late String lastName;
  late String email;
  late String confirmPassword;
  late String password;

  String errorMessage = "";

  signUp() async {
    loadingStatus = LoadingStatus.started;
    var response = await RegistrationApi().signUp(dataOrganizer());

    if (response['success'] == true) {
      loadingStatus = LoadingStatus.finished;
      registrationStatus = RegistrationStatusEnum.registered;
      notifyListeners();
    } else {
      errorMessage = isJson(response['data'])
          ? json.decode(response['data'])['message']
          : response['data'];
      registrationStatus = RegistrationStatusEnum.unRegistered;
      loadingStatus = LoadingStatus.finished;
      notifyListeners();
    }
  }

  resetErrorMessage() {
    errorMessage = "";
    notifyListeners();
  }

  Map<String, dynamic> dataOrganizer() {
    return {
      'firstName': firstName,
      "lastName": lastName,
      'email': email,
      'password': password,
      "confirmPassword": confirmPassword
    };
  }
}
