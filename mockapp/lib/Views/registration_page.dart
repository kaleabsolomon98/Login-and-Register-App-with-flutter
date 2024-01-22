// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:mockapp/Constants/app_strings.dart';
import 'package:mockapp/Providers/registrationProvider.dart';
import 'package:mockapp/Theme/text_styles.dart';
import 'package:mockapp/Utils/authentication_status.dart';
import 'package:mockapp/widgets/common/authentication_header.dart';
import 'package:mockapp/widgets/register_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterProvider registerProvider;

  @override
  void initState() {
    registerProvider = Provider.of<RegisterProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AutHeader(
            children: [
              Text(AppStrings.register, style: titleLarge),
              const SizedBox(height: 6),
              Text(AppStrings.createYourAccount, style: lightBodySmall),
            ],
          ),
          const RegisterForm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.iHaveAnAccount,
                style: darkBodySmall,
              ),
              TextButton(
                onPressed: () {
                  registerProvider.resetErrorMessage();
                  registerProvider.registrationStatus =
                      RegistrationStatusEnum.login;
                },
                child: const Text(AppStrings.login),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
