import 'package:flutter/material.dart';
import 'badge_view_model.dart';

class Badge extends StatelessWidget {
  final BadgeViewModel viewModel;

  const Badge._({super.key, required this.viewModel});

  static Widget instantiate({required BadgeViewModel viewModel}) {
    return Badge._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;

    switch (viewModel.style) {
      case BadgeStyle.success:
        backgroundColor = const Color(0xFFD6FFE7);
        break;
      case BadgeStyle.neutral:
        backgroundColor = const Color(0xFFE8ECEF);
        break;
      case BadgeStyle.error:
        backgroundColor = const Color(0xFFFDD8DE);
        break;
      case BadgeStyle.warning:
        backgroundColor = const Color(0xFFFFEFD7);
        break;
      case BadgeStyle.accent:
        backgroundColor = const Color(0xFFD6FFE7);
        break;
      case BadgeStyle.inverse:
        backgroundColor = Colors.white;
        break;
    }

    final hasIcon = viewModel.icon != null;
    final EdgeInsets padding = hasIcon
        ? const EdgeInsets.only(top: 2, left: 2, right: 8, bottom: 2)
        : const EdgeInsets.symmetric(horizontal: 8, vertical: 2);

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          child: Container(
            padding: padding,
            decoration: ShapeDecoration(
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (hasIcon) ...[
                  viewModel.icon!,
                  const SizedBox(width: 4), // Espaço entre ícone e texto
                ],
                SizedBox(
                  height: 24,
                  child: Text(
                    viewModel.text,
                    style: const TextStyle(
                      color: Color(0xFF002752),
                      fontSize: 16,
                      fontFamily: 'Galano',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
