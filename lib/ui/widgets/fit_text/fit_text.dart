import 'package:flutter/material.dart';

class FitText extends StatelessWidget {
  const FitText({required this.child, super.key});

  final Text child;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: child,
    );
  }
}
