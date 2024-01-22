// Flutter imports:
import 'package:flutter/material.dart';
import 'dart:async';

// Project imports:
import 'package:mockapp/Constants/api_constants.dart';
import 'package:mockapp/Model/api.dart';
import 'package:mockapp/Model/user.dart';
import 'package:mockapp/Utils/userpreferences.dart';

class LogoutApi {
  API request = API();

  Future<Map<String, dynamic>> signOut() async {
    User user = await UserPreferences().getUser();
    try {
      var response = await request.post(logOut, null, token: user.accessToken);
      return response;
    } catch (e, _) {
      debugPrint("MFSException: ${e.toString()} -- ${_.toString()}");
      return {'success': false, 'data': "Something went wrong"};
    }
  }
}
