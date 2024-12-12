import 'package:flutter/material.dart';

class AppTextStyle {

  static TextStyle createTextStyle(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }


  static const TextStyle navigationLarge = TextStyle(
    fontSize: 24,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle navigationMedium = TextStyle(
    fontSize: 16,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 32,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 24,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 20,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle titleXSmall = TextStyle(
    fontSize: 16,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 14,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w600,
    letterSpacing: 0.50,
  );

  static const TextStyle headingSmall = TextStyle(
    fontSize: 12,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w600,
    letterSpacing: 0.30,
  );

  static const TextStyle bodyExtraLarge = TextStyle(
    fontSize: 24,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyXSmall = TextStyle(
    fontSize: 12,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyExtraLargeBold = TextStyle(
    fontSize: 24,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyLargeBold = TextStyle(
    fontSize: 18,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyMediumBold = TextStyle(
    fontSize: 16,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodySmallBold = TextStyle(
    fontSize: 14,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyXSmallBold = TextStyle(
    fontSize: 12,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle linkMedium = TextStyle(
    fontSize: 16,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  static const TextStyle linkSmall = TextStyle(
    fontSize: 14,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  static const TextStyle linkXSmall = TextStyle(
    fontSize: 12,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  static const TextStyle buttonLabelLarge = TextStyle(
    fontSize: 18,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle buttonLabelMedium = TextStyle(
    fontSize: 16,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle buttonLabelSmall = TextStyle(
    fontSize: 14,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle buttonLabelXSmall = TextStyle(
    fontSize: 12,
    fontFamily: 'Galano',
    fontWeight: FontWeight.w600,
  );
}