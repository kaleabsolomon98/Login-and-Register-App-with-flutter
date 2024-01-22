// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'text_styles.dart';
import 'custom_colors.dart';

final ThemeData themeData = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: kprimaryColor,
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 34,
      letterSpacing: 0.5,
    ),
    bodySmall: TextStyle(
      color: Colors.grey,
      fontSize: 14,
      letterSpacing: 0.5,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Colors.transparent,
    errorStyle: TextStyle(fontSize: 12),
    contentPadding: EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 14,
    ),
    border: textFormFieldBorder,
    errorBorder: textFormFieldBorder,
    focusedBorder: textFormFieldBorder,
    focusedErrorBorder: textFormFieldBorder,
    enabledBorder: textFormFieldBorder,
    labelStyle: TextStyle(
      fontSize: 17,
      color: Colors.grey,
      fontWeight: FontWeight.w500,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: kprimaryColor,
      padding: const EdgeInsets.all(4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: kprimaryColor,
      minimumSize: const Size(double.infinity, 50),
      side: BorderSide(color: Colors.grey.shade200),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: kprimaryColor,
      disabledBackgroundColor: Colors.grey.shade300,
      minimumSize: const Size(double.infinity, 52),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    ),
  ),
);
