// Flutter imports:
import 'dart:async';
import 'package:flutter/material.dart';

// Project imports:
import 'package:mockapp/Constants/api_constants.dart';
import 'package:mockapp/Model/api.dart';
import 'package:mockapp/Model/user.dart';
import 'package:mockapp/Utils/userpreferences.dart';

class PasswordResetApi {
  API request = API();

  Future<Map<String, dynamic>> passwordReset(Map<String, dynamic> data) async {
    User user = await UserPreferences().getUser();
    try {
      var response =
          await request.put(resetPassword, data, token: user.accessToken);
      return response;
    } catch (e, _) {
      debugPrint("MFSException: ${e.toString()} -- ${_.toString()}");
      return {'success': false, 'data': "Something went wrong"};
    }
  }
}
