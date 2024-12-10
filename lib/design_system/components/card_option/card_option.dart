import 'package:flutter/material.dart' hide Badge;
import 'card_option_view_model.dart';
import '../badge/badge.dart';

class CardOption extends StatelessWidget {
  final CardOptionViewModel viewModel;

  const CardOption._({super.key, required this.viewModel});

  static Widget instantiate({required CardOptionViewModel viewModel}) {
    return CardOption._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        viewModel.enabled ? Colors.white : const Color(0xFFE8ECEF);
    final Color textColor =
        viewModel.enabled ? const Color(0xFF002752) : const Color(0xFF84898E);
    final Color borderColor =
        viewModel.enabled ? const Color(0xFFE8ECEF) : const Color(0xFFBEC3C8);
    final List<BoxShadow> shadows = viewModel.enabled
        ? [
            BoxShadow(
                color: const Color(0x14000000).withOpacity(0.14),
                blurRadius: 20,
                offset: const Offset(0, 6),
                spreadRadius: 0),
            BoxShadow(
                color: const Color(0x07000000).withOpacity(0.07),
                blurRadius: 4,
                offset: const Offset(0, 3),
                spreadRadius: 0),
          ]
        : [
            BoxShadow(
                color: const Color(0x14000000).withOpacity(0.14),
                blurRadius: 12,
                offset: const Offset(0, 4),
                spreadRadius: 0),
            BoxShadow(
                color: const Color(0x07000000).withOpacity(0.07),
                blurRadius: 5,
                offset: const Offset(0, 0.5),
                spreadRadius: 0),
          ];

    return InkWell(
      onTap: viewModel.enabled ? viewModel.onTap : null,
      child: Container(
        width: 430,
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          shadows: shadows,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (viewModel.icon != null)
              SizedBox(
                width: 32,
                child: viewModel.icon,
              ),
            if (viewModel.icon != null) const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (viewModel.title != null)
                    Text(
                      viewModel.title!,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontFamily: 'Galano',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                  if (viewModel.title != null && viewModel.description != null)
                    const SizedBox(height: 4),
                  if (viewModel.description != null)
                    Text(
                      viewModel.description!,
                      style: const TextStyle(
                        color: Color(0xFF5D6468),
                        fontSize: 16,
                        fontFamily: 'Galano Telepass',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  if (viewModel.badge != null) const SizedBox(height: 8),
                  if (viewModel.badge != null)
                    Badge.instantiate(viewModel: viewModel.badge!),
                ],
              ),
            ),
            if (viewModel.enabled && viewModel.trailingWidget != null)
              const SizedBox(width: 16),
            if (viewModel.enabled && viewModel.trailingWidget != null)
              SizedBox(
                width: 24,
                height: 24,
                child: viewModel.trailingWidget,
              ),
          ],
        ),
      ),
    );
  }
}
