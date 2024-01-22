// Package imports:
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// Project imports:
import 'package:mockapp/Providers/authentication/login_provider.dart';
import 'package:mockapp/Providers/authentication/password_reset.dart';
import 'package:mockapp/Providers/registrationProvider.dart';

/// Setup the provider injector.
List<SingleChildWidget> providerInjector = [
  ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
  ChangeNotifierProvider(create: (_) => RegisterProvider()),
  ChangeNotifierProvider(create: (_) => PasswordResetProvider()),
];
