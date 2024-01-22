// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:mockapp/Constants/app_strings.dart';
import 'package:mockapp/Providers/authentication/login_provider.dart';
import 'package:mockapp/Theme/text_styles.dart';
import 'package:mockapp/Utils/Icons_asset.dart';
import 'package:mockapp/Utils/authentication_status.dart';
import 'package:mockapp/Utils/validator.dart';
import 'package:mockapp/widgets/common/generic_textfield.dart';
import 'package:mockapp/widgets/common/loading_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();

  bool showPassword = false;

  late AuthenticationProvider authProvider;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    authProvider = Provider.of<AuthenticationProvider>(context, listen: true);
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GenericTextField(
              controller: emailController,
              labelText: AppStrings.email,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onChanged: (value) => authProvider.username = value,
              validator: (val) => emailValidator(val!),
            ),
            GenericTextField(
              obscureText: showPassword,
              controller: passwordController,
              labelText: AppStrings.password,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) => authProvider.password = value,
              validator: (val) => passwordValidator(val!),
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
            authProvider.errorMessage == ""
                ? const SizedBox(height: 0)
                : Center(
                    child: Text(
                      authProvider.errorMessage,
                      style: errorText,
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
                onPressed: () => onSubmitPressed(context),
                child: authProvider.loadingStatus == LoadingStatus.started
                    ? loadingWidget
                    : const Text(AppStrings.login),
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

  onSubmitPressed(BuildContext context) async {
    authProvider.resetErrorMessage();
    if (_formKey.currentState!.validate()) {
      authProvider.signIn();
    }
  }
}
