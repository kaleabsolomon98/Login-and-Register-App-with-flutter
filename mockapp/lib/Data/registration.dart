// Flutter imports:
import 'dart:async';
import 'package:flutter/material.dart';

// Project imports:
import 'package:mockapp/Constants/api_constants.dart';
import 'package:mockapp/Model/api.dart';

class RegistrationApi {
  API request = API();

  Future<Map<String, dynamic>> signUp(Map<String, dynamic> data) async {
    try {
      var response = await request.post(register, data);
      return response;
    } catch (e, _) {
      debugPrint("MFSException: ${e.toString()} -- ${_.toString()}");
      return {'success': false, 'data': "Something went wrong"};
    }
  }
}
