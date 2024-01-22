// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:mockapp/Constants/app_strings.dart';
import 'package:mockapp/Providers/registrationProvider.dart';
import 'package:mockapp/Theme/text_styles.dart';
import 'package:mockapp/Utils/authentication_status.dart';
import 'package:mockapp/Utils/validator.dart';
import 'package:mockapp/widgets/common/generic_textfield.dart';
import 'package:mockapp/widgets/common/loading_widget.dart';


class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool showPassword = false;
  bool showConfirmpassword = false;
  late RegisterProvider registerProvider;

  void disposeControllers() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    registerProvider = Provider.of<RegisterProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GenericTextField(
              autofocus: true,
              labelText: AppStrings.firstName,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              onChanged: (value) => registerProvider.firstName = value,
              validator: (value) => firstNameValidator(value!),
              controller: firstNameController,
            ),
            GenericTextField(
              autofocus: true,
              labelText: AppStrings.lastName,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              onChanged: (value) => registerProvider.lastName = value,
              validator: (value) => lastNameValidator(value!),
              controller: lastNameController,
            ),
            GenericTextField(
              labelText: AppStrings.email,
              controller: emailController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => registerProvider.email = value,
              validator: (val) => emailValidator(val!),
            ),
            GenericTextField(
              obscureText: showPassword,
              controller: passwordController,
              labelText: AppStrings.password,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) => registerProvider.password = value,
              validator: (val) => passwordValidator(val!),
              suffixIcon: Focus(
                descendantsAreFocusable: false,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  style: IconButton.styleFrom(
                    minimumSize: const Size.square(48),
                  ),
                  icon: Icon(
                    showPassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            GenericTextField(
              labelText: AppStrings.confirmPassword,
              controller: confirmPasswordController,
              obscureText: showConfirmpassword,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) => registerProvider.confirmPassword = value,
              validator: (value) => confirmPasswordValidator(value!,
                  passwordController.text, confirmPasswordController.text),
              suffixIcon: Focus(
                descendantsAreFocusable: false,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      showConfirmpassword = !showConfirmpassword;
                    });
                  },
                  style: IconButton.styleFrom(
                    minimumSize: const Size.square(48),
                  ),
                  icon: Icon(
                    showConfirmpassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            registerProvider.errorMessage == ""
                ? const SizedBox(height: 0)
                : Center(
                    child: Text(
                      registerProvider.errorMessage,
                      style: errorText,
                    ),
                  ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => onSubmitPressed(context),
              child: registerProvider.loadingStatus == LoadingStatus.started
                  ? loadingWidget
                  : const Text(AppStrings.register),
            )
          ],
        ),
      ),
    );
  }

  onSubmitPressed(BuildContext context) async {
    registerProvider.resetErrorMessage();
    if (_formKey.currentState!.validate()) {
      registerProvider.signUp();
    }
  }
}
