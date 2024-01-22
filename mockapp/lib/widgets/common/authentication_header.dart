// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:mockapp/Theme/custom_colors.dart';
import 'package:mockapp/Utils/extension.dart';

class AutHeader extends StatelessWidget {
  const AutHeader({
    required this.children,
    this.colors = defaultGradient,
    super.key,
  });

  final List<Color> colors;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: LinearGradient(colors: colors)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: context.heightFraction(sizeFraction: 0.1),
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}
