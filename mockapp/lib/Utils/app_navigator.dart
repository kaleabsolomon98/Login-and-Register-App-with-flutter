import 'package:flutter/material.dart';

/// Navigates to another `screen` by pushing it on top of the navigation stack.
///
/// `context` - The build context
///
/// `screen` - The screen to change to
changeScreen(BuildContext context, Widget screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
}

/// Closes the current screen and opens another `screen`
///
/// `context` - The build context
///
/// `screen` - The screen to change to
closeAndChangeScreen(BuildContext context, Widget screen) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => screen));
}
