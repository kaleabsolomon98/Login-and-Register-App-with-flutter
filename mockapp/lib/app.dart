import 'package:flutter/material.dart';
import 'package:mockapp/Theme/custom_theme.dart';
import 'package:mockapp/Views/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const LoginPage(),
    );
  }
}
