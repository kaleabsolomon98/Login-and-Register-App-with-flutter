// Project imports:
import 'package:mockapp/Model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  bool returningUser = false;
  late SharedPreferences preferences;

  Future<void> setUser(User userInfo) async {
    preferences = await SharedPreferences.getInstance();
    await preferences.setString("accessToken", userInfo.accessToken);
    await preferences.setString("refreshToken", userInfo.refreshToken);
  }

  Future<User> getUser() async {
    preferences = await SharedPreferences.getInstance();
    return User(
        accessToken: preferences.getString("accessToken") ?? "null",
        refreshToken: preferences.getString("refreshToken") ?? "null");
  }

  removeUser() async {
    preferences = await SharedPreferences.getInstance();
    preferences.remove("accessToken");
    preferences.remove("refreshToken");
  }
}
