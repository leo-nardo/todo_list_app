import 'package:flutter/material.dart';

import '../../components/checkbox/checkbox_view_model.dart';
import '../../components/checkbox/custom_checkbox.dart';

class CustomCheckboxSampleScreen extends StatefulWidget {
  const CustomCheckboxSampleScreen({Key? key}) : super(key: key);

  @override
  State<CustomCheckboxSampleScreen> createState() =>
      _CustomCheckboxSampleScreenState();
}

class _CustomCheckboxSampleScreenState
    extends State<CustomCheckboxSampleScreen> {
  bool _checkboxValue1 = false;
  bool _checkboxValue2 = false;
  bool _checkboxValue3 = false;
  bool _checkboxValue4 = false;
  bool _checkboxValue5 = false;
  bool _checkboxValue6 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Checkbox Examples'),
      ),
      body: SingleChildScrollView(
        // Adiciona SingleChildScrollView para rolagem
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Checkbox normal quadrado
            CustomCheckbox.instantiate(
              viewModel: CheckboxViewModel(
                value: _checkboxValue1,
                onChanged: (value) =>
                    setState(() => _checkboxValue1 = value ?? false),
              ),
            ),
            const SizedBox(height: 16),

            // Checkbox normal redondo
            CustomCheckbox.instantiate(
              viewModel: CheckboxViewModel(
                value: _checkboxValue2,
                shape: CheckboxShape.rounded,
                onChanged: (value) =>
                    setState(() => _checkboxValue2 = value ?? false),
              ),
            ),
            const SizedBox(height: 16),

            // Checkbox com erro quadrado
            CustomCheckbox.instantiate(
              viewModel: CheckboxViewModel(
                value: _checkboxValue3,
                state: CheckboxState.error,
                onChanged: (value) =>
                    setState(() => _checkboxValue3 = value ?? false),
              ),
            ),
            const SizedBox(height: 16),

            // Checkbox com erro redondo
            CustomCheckbox.instantiate(
              viewModel: CheckboxViewModel(
                value: _checkboxValue4,
                shape: CheckboxShape.rounded,
                state: CheckboxState.error,
                onChanged: (value) =>
                    setState(() => _checkboxValue4 = value ?? false),
              ),
            ),
            const SizedBox(height: 16),

            // Checkbox desabilitado quadrado
            CustomCheckbox.instantiate(
              viewModel: CheckboxViewModel(
                value: _checkboxValue5,
                state: CheckboxState.disabled,
                onChanged: (value) =>
                    setState(() => _checkboxValue5 = value ?? false),
              ),
            ),
            const SizedBox(height: 16),

            // Checkbox desabilitado redondo
            CustomCheckbox.instantiate(
              viewModel: CheckboxViewModel(
                value: _checkboxValue6,
                shape: CheckboxShape.rounded,
                state: CheckboxState.disabled,
                onChanged: (value) =>
                    setState(() => _checkboxValue6 = value ?? false),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
