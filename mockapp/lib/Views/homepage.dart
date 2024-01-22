// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:mockapp/Providers/authentication/login_provider.dart';
import 'package:mockapp/Theme/custom_colors.dart';
import 'package:mockapp/Theme/text_styles.dart';
import 'package:mockapp/widgets/change_password.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AuthenticationProvider authProvider;

  @override
  void initState() {
    authProvider = Provider.of<AuthenticationProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: kdarkBlue,
        title: Center(
          child: Text(
            'HomePage',
            style: titleLarge,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => authProvider.signOut(),
              icon: const Icon(
                Icons.logout,
                color: kprimaryColor,
              ))
        ],
      ),
      body: const PasswordResetForm(),
    );
  }
}
