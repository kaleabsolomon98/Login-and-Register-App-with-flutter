// Flutter imports:
import 'dart:convert';

bool isJson(dynamic data) {
  try {
    final decodedData = json.decode(data);
    return decodedData is Map<String, dynamic>;
  } catch (e) {
    return false;
  }
}
