class User {
  String accessToken, refreshToken;

  User({required this.accessToken, required this.refreshToken});

  factory User.fromJson(Map<String, dynamic> responseJson) => User(
        accessToken: responseJson['access_token'] as String,
        refreshToken: responseJson['refresh_token'] as String,
      );
}
