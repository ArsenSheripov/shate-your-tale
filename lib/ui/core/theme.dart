import 'package:flutter/foundation.dart';
import 'package:share_your_tale/ui/core/color.dart';
import 'package:share_your_tale/ui/core/typography.dart';

@immutable
class AppTheme {
  const AppTheme({required this.color, required this.typography});

  final AppColor color;
  final AppTypography typography;
}
