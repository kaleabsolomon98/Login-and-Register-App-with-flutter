// Flutter imports:
import 'package:flutter/material.dart';
import 'dart:convert';

// Project imports:
import 'package:mockapp/Data/Authentication/login.dart';
import 'package:mockapp/Data/Authentication/logout.dart';
import 'package:mockapp/Model/user.dart';
import 'package:mockapp/Utils/authentication_status.dart';
import 'package:mockapp/Utils/json_detector.dart';
import 'package:mockapp/Utils/userpreferences.dart';

class AuthenticationProvider with ChangeNotifier {
  AuthenticationStatusEnum authenticationStatus =
      AuthenticationStatusEnum.unknown;
  LoadingStatus loadingStatus = LoadingStatus.waitting;

  late String username;
  late String password;
  String errorMessage = "";

  signIn() async {
    loadingStatus = LoadingStatus.started;
    var response = await AuthenticationApi().signIn(username, password);

    if (response['success'] == true) {
      await UserPreferences().setUser(User.fromJson(response['data']));
      authenticationStatus = AuthenticationStatusEnum.authenticated;
      loadingStatus = LoadingStatus.finished;
      notifyListeners();
    } else {
      errorMessage = isJson(response['data'])
          ? json.decode(response['data'])['message']
          : response['data'];
      authenticationStatus = AuthenticationStatusEnum.unauthenticated;
      loadingStatus = LoadingStatus.finished;
      notifyListeners();
    }
  }

  signOut() async {
    var response = await LogoutApi().signOut();
    if (response['success'] == true) {
      UserPreferences().removeUser();
      authenticationStatus = AuthenticationStatusEnum.unauthenticated;
      notifyListeners();
    } else {
      errorMessage = response['data'];
      notifyListeners();
    }
  }

  resetErrorMessage() {
    errorMessage = "";
    notifyListeners();
  }
}
