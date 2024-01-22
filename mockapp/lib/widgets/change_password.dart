// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:mockapp/Constants/app_strings.dart';
import 'package:mockapp/Providers/authentication/password_reset.dart';
import 'package:mockapp/Theme/text_styles.dart';
import 'package:mockapp/Utils/authentication_status.dart';
import 'package:mockapp/Utils/validator.dart';
import 'package:mockapp/widgets/common/generic_textfield.dart';
import 'package:mockapp/widgets/common/loading_widget.dart';

class PasswordResetForm extends StatefulWidget {
  const PasswordResetForm({super.key});

  @override
  State<PasswordResetForm> createState() => _PasswordResetFormState();
}

class _PasswordResetFormState extends State<PasswordResetForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool showNewPassword = false;
  bool showOldPassword = false;
  bool showConfirmpassword = false;

  late PasswordResetProvider passwordResetProvider;

  void disposeControllers() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    passwordResetProvider =
        Provider.of<PasswordResetProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GenericTextField(
              obscureText: showOldPassword,
              controller: oldPasswordController,
              labelText: AppStrings.oldPassword,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) => passwordResetProvider.oldPassword = value,
              validator: (val) => passwordValidator(val!),
              suffixIcon: Focus(
                descendantsAreFocusable: false,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      showOldPassword = !showOldPassword;
                    });
                  },
                  style: IconButton.styleFrom(
                    minimumSize: const Size.square(48),
                  ),
                  icon: Icon(
                    showOldPassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            GenericTextField(
              obscureText: showNewPassword,
              controller: newPasswordController,
              labelText: AppStrings.newPassword,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) => passwordResetProvider.newPassword = value,
              validator: (val) => passwordValidator(val!),
              suffixIcon: Focus(
                descendantsAreFocusable: false,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      showNewPassword = !showNewPassword;
                    });
                  },
                  style: IconButton.styleFrom(
                    minimumSize: const Size.square(48),
                  ),
                  icon: Icon(
                    showNewPassword
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
              onChanged: (value) =>
                  passwordResetProvider.confirmPassword = value,
              validator: (value) => confirmPasswordValidator(value!,
                  newPasswordController.text, confirmPasswordController.text),
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
            passwordResetProvider.errorMessage == ""
                ? const SizedBox(height: 0)
                : Center(
                    child: Text(
                      passwordResetProvider.errorMessage,
                      style: errorText,
                    ),
                  ),
            const SizedBox(height: 20),
            passwordResetProvider.successMessage == ""
                ? const SizedBox(height: 0)
                : Center(
                    child: Text(
                      passwordResetProvider.successMessage,
                      style: successText,
                    ),
                  ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => onSubmitPressed(context),
              child:
                  passwordResetProvider.loadingStatus == LoadingStatus.started
                      ? loadingWidget
                      : const Text(AppStrings.register),
            )
          ],
        ),
      ),
    );
  }

  onSubmitPressed(BuildContext context) async {
    passwordResetProvider.resetMessages();
    if (_formKey.currentState!.validate()) {
      passwordResetProvider.passwordReset();
    }
  }
}
