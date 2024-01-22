// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:mockapp/Providers/authentication/login_provider.dart';
import 'package:mockapp/Providers/registrationProvider.dart';
import 'package:mockapp/Utils/authentication_status.dart';
import 'package:mockapp/Views/homepage.dart';
import 'package:mockapp/Views/login_page.dart';
import 'package:mockapp/Views/registration_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AuthenticationStatusEnum currentStatus;

  late RegistrationStatusEnum registrationStatus;

  @override
  Widget build(BuildContext context) {
    currentStatus =
        Provider.of<AuthenticationProvider>(context).authenticationStatus;
    registrationStatus =
        Provider.of<RegisterProvider>(context, listen: true).registrationStatus;

    return currentStatus == AuthenticationStatusEnum.authenticated
        ? const HomePage()
        : registrationStatus == RegistrationStatusEnum.registered ||
                registrationStatus == RegistrationStatusEnum.login
            ? const LoginPage()
            : const RegisterPage();
  }
}
