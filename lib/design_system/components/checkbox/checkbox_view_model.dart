import 'package:flutter/material.dart';

enum CheckboxShape { rounded, square }

enum CheckboxState { enabled, disabled, error }

class CheckboxViewModel {
  final bool value;
  final CheckboxShape shape;
  final CheckboxState state;
  final ValueChanged<bool?> onChanged; // <--- Alteração aqui

  CheckboxViewModel({
    required this.value,
    this.shape = CheckboxShape.square,
    this.state = CheckboxState.enabled,
    required this.onChanged,
  });
}
