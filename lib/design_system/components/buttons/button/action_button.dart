import 'package:flutter/material.dart';
import 'action_button_view_model.dart';

class ActionButton extends StatelessWidget {
  final ActionButtonViewModel viewModel;

  const ActionButton._({super.key, required this.viewModel});

  static Widget instantiate({required ActionButtonViewModel viewModel}) {
    return ActionButton._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    final double borderRadius = 25;
    final double horizontalPadding =
        viewModel.size == ActionButtonSize.small ? 16 : 24;
    final double verticalPadding =
        viewModel.size == ActionButtonSize.small ? 13 : 12;
    final double iconSize = viewModel.size == ActionButtonSize.small ? 16 : 24;
    final TextStyle textStyle = viewModel.size == ActionButtonSize.small
        ? TextStyle(
            fontSize: 14,
            fontFamily: 'Galano',
            fontWeight: FontWeight.w600,
            height: 0.10)
        : TextStyle(
            fontSize: 16,
            fontFamily: 'Galano',
            fontWeight: FontWeight.w600,
            height: 0.09);

    Color textColor;
    Color backgroundColor;
    BorderSide borderSide = BorderSide.none;

    switch (viewModel.style) {
      case ActionButtonStyle.text:
        textColor = viewModel.enabled ? Color(0xFF0071EB) : Color(0xFF84898E);
        backgroundColor = Color.fromARGB(0, 0, 0, 0);
        break;
      case ActionButtonStyle.primary:
        textColor = viewModel.enabled ? Color(0xFFE2EEFD) : Color(0xFF84898E);
        backgroundColor =
            viewModel.enabled ? Color(0xFF0071EB) : Color(0xFFE8ECEF);
        break;
      case ActionButtonStyle.secondary:
        textColor = viewModel.enabled ? Color(0xFF0071EB) : Color(0xFF84898E);
        backgroundColor =
            viewModel.enabled ? Color(0xFFE2EEFD) : Color(0xFFE8ECEF);
        break;
      case ActionButtonStyle.ghost:
        textColor = viewModel.enabled ? Color(0xFF0070EA) : Color(0xFFBEC3C8);
        backgroundColor = Colors.blue.withOpacity(0.0);
        borderSide = BorderSide(
            width: 2,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: textColor);
        break;
    }

    final double buttonWidth =
        viewModel.size == ActionButtonSize.small ? 160 : 311;
    final double buttonHeight =
        viewModel.size == ActionButtonSize.small ? 40 : 48;

    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: InkWell(
        // InkWell para detectar toques
        onTap: viewModel.enabled ? viewModel.onPressed : null,
        borderRadius: BorderRadius.circular(
            borderRadius), // Aplicar o borderRadius ao InkWell
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.fromBorderSide(borderSide),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (viewModel.icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(viewModel.icon, size: iconSize, color: textColor),
                ),
              Text(
                viewModel.text,
                style: textStyle.copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
