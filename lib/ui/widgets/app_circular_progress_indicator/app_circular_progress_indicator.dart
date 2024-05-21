import 'package:flutter/material.dart';

/// Common progress indicator for buttons.
class AppCircularProgressIndicator extends StatelessWidget {
  const AppCircularProgressIndicator({
    required this.color,
    required this.backgroundColor,
    this.strokeWidth = 3,
    this.dimension = 18,
    super.key,
  });

  final Color color;
  final Color backgroundColor;
  final double strokeWidth;
  final double dimension;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        color: color,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
