import 'package:flutter/material.dart';
import 'package:mockapp/Constants/app_strings.dart';
import 'package:mockapp/Theme/text_styles.dart';
import 'package:mockapp/widgets/common/authentication_header.dart';
import 'package:mockapp/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          AutHeader(
            children: [
              Text(
                AppStrings.signInToYourNAccount,
                style: titleLarge,
              ),
              const SizedBox(height: 6),
              Text(AppStrings.signInToYourAccount, style: lightBodySmall),
            ],
          ),
          const LoginForm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.doNotHaveAnAccount,
                style: darkBodySmall,
              ),
              const SizedBox(width: 4),
              TextButton(
                onPressed: () {},
                child: const Text(AppStrings.register),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
