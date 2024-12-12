import 'package:flutter/material.dart';
import 'checkbox_view_model.dart';

class CustomCheckbox extends StatelessWidget {
  final CheckboxViewModel viewModel;

  const CustomCheckbox._({super.key, required this.viewModel});

  static Widget instantiate({required CheckboxViewModel viewModel}) {
    return CustomCheckbox._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    final Color checkColor =
        viewModel.state == CheckboxState.error && !viewModel.value
            ? Colors.red
            : Colors.white;
    const Color activeColor = Colors.blue;
    final Color disabledColor = Colors.grey[400]!;

    return Checkbox(
      value: viewModel.value,
      onChanged: viewModel.state == CheckboxState.disabled
          ? null
          : (value) {
              viewModel.onChanged(value);
            },
      shape: viewModel.shape == CheckboxShape.rounded
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      checkColor: checkColor,
      activeColor:
          viewModel.value ? activeColor : Colors.grey[400]!, // Corrigido aqui
      side: viewModel.state == CheckboxState.error && !viewModel.value
          ? const BorderSide(color: Colors.red, width: 2)
          : null,
    );
  }
}
