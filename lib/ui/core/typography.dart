import 'package:flutter/material.dart';

@immutable
class AppTypography {
  const AppTypography();

  static const outfit = 'Outfit';

  final title1 = const TextStyle(
    fontFamily: outfit,
    fontSize: 55,
    fontWeight: FontWeight.w700,
  );

  final title2 = const TextStyle(
    fontFamily: outfit,
    fontSize: 32,
    fontWeight: FontWeight.w500,
  );

  final title3 = const TextStyle(
    fontFamily: outfit,
    fontSize: 32,
    fontWeight: FontWeight.w400,
  );

  final headline1 = const TextStyle(
    fontFamily: outfit,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  final headline2 = const TextStyle(
    fontFamily: outfit,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  final caption = const TextStyle(
    fontFamily: outfit,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}
