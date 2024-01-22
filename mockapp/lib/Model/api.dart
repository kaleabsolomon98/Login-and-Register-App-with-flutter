// Flutter imports:
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:mockapp/Constants/api_constants.dart';

class API {
  var response;
  var platformVersion;

  userAgentInitializer() async {
    await FkUserAgent.init();
    platformVersion = FkUserAgent.userAgent!;
  }

  Future<Map<String, dynamic>> get(String endpoint, String token) async {
    await userAgentInitializer();

    var response = await http.get(
      Uri.parse(baseUrl + endpoint),
      headers: {
        'user-agent': platformVersion,
        HttpHeaders.authorizationHeader: "Bearer $token"
      },
    );

    var result = _responseHandler(response);
    return result;
  }

  Future<Map<String, dynamic>> post(
      String endpoints, Map<String, dynamic>? data,
      {String? token}) async {
    await userAgentInitializer();
    if (token == null) {
      response = await http.post(Uri.parse(baseUrl + endpoints),
          body: json.encode(data),
          headers: {
            'Content-Type': 'application/json',
            'user-agent': platformVersion
          });
    } else {
      response = await http.post(Uri.parse(baseUrl + endpoints),
          body: data == null ? null : jsonEncode(data),
          headers: {
            'Content-Type': 'application/json',
            'user-agent': platformVersion,
            HttpHeaders.authorizationHeader: "Bearer $token"
          });
    }
    return _responseHandler(response);
  }

  Future<Map<String, dynamic>> put(String endpoints, Map data,
      {String? token}) async {
    await userAgentInitializer();
    var response = await http
        .put(Uri.parse(baseUrl + endpoints), body: json.encode(data), headers: {
      'Content-Type': 'application/json',
      'user-agent': platformVersion,
      HttpHeaders.authorizationHeader: "Bearer $token"
    });
    return _responseHandler(response);
  }

  Map<String, dynamic> _responseHandler(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return {
          'success': true,
          'data': response.body.isNotEmpty ? json.decode(response.body) : null
        };
      case 201:
        return {
          'success': true,
          'data': response.body.isNotEmpty ? json.decode(response.body) : null
        };
      case 400:
        return {
          'success': false,
          'data': json.decode(response.body)['message']
        };
      case 401:
        return {'success': false, 'data': response.body};
      case 403:
        return {'success': false, 'data': response.body};
      case 404:
        return {'success': false, 'data': json.decode(response.body)['error']};
      case 500:
        return {'success': false, 'data': response.body};
      default:
        return {'success': false, 'data': response.body};
    }
  }
}
