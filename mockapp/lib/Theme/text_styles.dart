// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'custom_colors.dart';

TextStyle titleLarge = TextStyle(
  fontWeight: FontWeight.bold,
  color: primaryTextColor,
  fontSize: 34,
  letterSpacing: 0.5,
);

TextStyle lightBodySmall = TextStyle(
  color: secondaryTextColor,
  letterSpacing: 0.5,
);

TextStyle darkBodySmall = TextStyle(
  color: secondaryTextColor,
  letterSpacing: 0.5,
);

const textFormFieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide(color: Colors.grey, width: 1.6),
);
