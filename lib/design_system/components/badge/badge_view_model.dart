import 'package:flutter/material.dart';

enum BadgeStyle {
  success,
  neutral,
  error,
  warning,
  accent,
  inverse,
}

class BadgeViewModel {
  final BadgeStyle style;
  final String text;
  final Widget? icon;

  BadgeViewModel({
    required this.style,
    required this.text,
    this.icon,
  });
}
