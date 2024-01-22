// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'custom_colors.dart';

TextStyle titleLarge = TextStyle(
  fontWeight: FontWeight.bold,
  color: kprimaryTextColor,
  fontSize: 34,
  letterSpacing: 0.5,
);

TextStyle lightBodySmall = TextStyle(
  color: ksecondaryTextColor,
  letterSpacing: 0.5,
);

TextStyle darkBodySmall = TextStyle(
  color: ksecondaryTextColor,
  letterSpacing: 0.5,
);

TextStyle errorText = TextStyle(
    color: kerrorTextColor,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    fontStyle: FontStyle.italic);

TextStyle successText = const TextStyle(
    color: kdarkBlue,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    fontStyle: FontStyle.italic);

const textFormFieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide(color: Colors.grey, width: 1.6),
);
