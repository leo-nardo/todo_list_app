import 'package:flutter/material.dart';

import '../badge/badge_view_model.dart';

class CardOptionViewModel {
  final String? title;
  final String? description;
  final Widget? icon;
  final BadgeViewModel? badge;
  final bool enabled;
  final VoidCallback? onTap;
  final Widget? trailingWidget;

  CardOptionViewModel({
    this.title,
    this.description,
    this.icon,
    this.badge,
    this.enabled = true,
    this.onTap,
    this.trailingWidget,
  });
}
