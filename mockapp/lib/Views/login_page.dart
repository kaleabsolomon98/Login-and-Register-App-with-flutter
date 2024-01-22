// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:mockapp/Constants/app_strings.dart';
import 'package:mockapp/Providers/authentication/login_provider.dart';
import 'package:mockapp/Providers/registrationProvider.dart';
import 'package:mockapp/Theme/text_styles.dart';
import 'package:mockapp/Utils/authentication_status.dart';
import 'package:mockapp/widgets/common/authentication_header.dart';
import 'package:mockapp/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthenticationProvider authProvider;
  late RegisterProvider registerProvider;

  @override
  void initState() {
    authProvider = Provider.of<AuthenticationProvider>(context, listen: false);
    registerProvider = Provider.of<RegisterProvider>(context, listen: false);
    super.initState();
  }

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
                onPressed: () {
                  authProvider.resetErrorMessage();
                  registerProvider.registrationStatus =
                      RegistrationStatusEnum.unRegistered;
                },
                child: const Text(AppStrings.register),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
