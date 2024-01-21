import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:mockapp/Constants/app_strings.dart';
import 'package:mockapp/Theme/text_styles.dart';
import 'package:mockapp/Utils/Icons_asset.dart';
import 'package:mockapp/Utils/password_strength_checker.dart';
import 'package:mockapp/widgets/common/generic_textfield.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();

  bool showPassword = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      // autovalidateMode:AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GenericTextField(
              key: _emailKey,
              controller: emailController,
              labelText: AppStrings.email,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onChanged: (val) => _emailKey.currentState?.validate(),
              validator: ValidationBuilder().email().build(),
            ),
            GenericTextField(
              key: _passwordKey,
              obscureText: showPassword,
              controller: passwordController,
              labelText: AppStrings.password,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              onChanged: (val) => _passwordKey.currentState?.validate(),
              validator: (val) {
                if (val!.isEmpty) {
                  return 'The field is required';
                } else if (!PasswordStrengthCheker.isStrongPassword(val)) {
                  return 'Password is weak';
                }
                return null;
              },
              suffixIcon: IconButton(
                style: IconButton.styleFrom(
                  minimumSize: const Size.square(48),
                ),
                icon: Icon(
                  showPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 20,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(AppStrings.forgotPassword),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: screenWidth * 0.9,
              child: FilledButton(
                onPressed: () {},
                child: const Text(AppStrings.login),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey.shade200)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(AppStrings.orLoginWith, style: darkBodySmall),
                ),
                Expanded(child: Divider(color: Colors.grey.shade200)),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset(IconsAsset.google, width: 14),
                    label: const Text(
                      AppStrings.google,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset(IconsAsset.facebook, width: 14),
                    label: const Text(
                      AppStrings.facebook,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
