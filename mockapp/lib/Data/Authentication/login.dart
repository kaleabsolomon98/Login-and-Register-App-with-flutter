// Flutter imports:
import 'package:flutter/material.dart';
import 'dart:async';

// Project imports:
import 'package:mockapp/Constants/api_constants.dart';
import 'package:mockapp/Model/api.dart';

class AuthenticationApi {
  API request = API();

  Future<Map<String, dynamic>> signIn(userName, password) async {
    Map<String, dynamic> data = {'username': userName, 'password': password};
    try {
      var response = await request.post(login, data);
      return response;
    } catch (e, _) {
      debugPrint("MFSException: ${e.toString()} -- ${_.toString()}");
      return {'success': false, 'data': "Something went wrong"};
    }
  }
}
