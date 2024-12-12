import 'package:flutter/material.dart';

import '../../components/buttons/button/action_button.dart';
import '../../components/buttons/button/action_button_view_model.dart';
import '../action_button_sample_screen/action_button_sample_screen.dart';
import '../badge_sample_screen/badge_sample_screen.dart';
import '../bottom_tab_bar_sample_screen/bottom_tab_bar_sample_screen.dart';
import '../card_option_sample_screen/card_option_sample_screen.dart';
import '../custom_checkbox_sample_screen/custom_checkbox_sample_screen.dart';
import '../input_field_sample_screen/input_field_sample_screen.dart';
import '../linked_label_sample_screen/linked_label_sample_screen.dart';
import '../segmented_sample_screen/segmented_sample_screen.dart';
import '../tab_component_sample_screen/tab_component_sample_screen.dart';

class DesignSystemSamplesScreen extends StatelessWidget {
  const DesignSystemSamplesScreen({super.key});

  void _navigateToSample(BuildContext context, Widget sampleScreen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => sampleScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Design System Samples')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSampleButton(
                context, ActionButtonPage(), 'Action Button'),
                const SizedBox(height: 16),
            _buildSampleButton(context, BadgeSampleScreen(), 'Badge'),
            const SizedBox(height: 16),
            _buildSampleButton(
                context, BottomTabBarPage(), 'Bottom Tab Bar'),
                const SizedBox(height: 16),
            _buildSampleButton(
                context, CardOptionSampleScreen(), 'Card Option'),
                const SizedBox(height: 16),
            _buildSampleButton(
                context, CustomCheckboxSampleScreen(), 'Custom Checkbox'),
                const SizedBox(height: 16),
            _buildSampleButton(
                context, InputFieldPage(), 'Input Field'),
                const SizedBox(height: 16),
            _buildSampleButton(
                context, LinkedLabelPage(), 'Linked Label'),
                const SizedBox(height: 16),
            _buildSampleButton(context, SegmentedSampleScreen(), 'Segmented'),
            const SizedBox(height: 16),
            _buildSampleButton(
                context, TabPage(), 'Tab Component'),
                const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSampleButton(
      BuildContext context, Widget sampleScreen, String title) {
    return ActionButton.instantiate(
      viewModel: ActionButtonViewModel(
        style: ActionButtonStyle.primary,
        size: ActionButtonSize.small,
        text: title,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => sampleScreen),
        ),
      ),
    );
  }
}
