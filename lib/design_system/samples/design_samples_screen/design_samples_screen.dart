import 'package:flutter/material.dart';

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
   DesignSystemSamplesScreen({super.key});

  final List<Map<String, dynamic>> samples = [
    {
      'title': 'Action Button',
      'route': '/actionButton',
      'screen': ActionButtonPage(),
    },
    {
      'title': 'Badge',
      'route': '/badge',
      'screen': const BadgeSampleScreen(),
    },
    {
      'title': 'Bottom Tab Bar',
      'route': '/bottomTabBar',
      'screen': const BottomTabBarPage(),
    },
    {
      'title': 'Card Option',
      'route': '/cardOption',
      'screen': const CardOptionSampleScreen(),
    },
    {
      'title': 'Custom Checkbox',
      'route': '/customCheckbox',
      'screen': const CustomCheckboxSampleScreen(),
    },
    {
      'title': 'Input Field',
      'route': '/inputField',
      'screen': InputFieldPage(),
    },
    {
      'title': 'Linked Label',
      'route': '/linkedLabel',
      'screen': const LinkedLabelPage(),
    },
    {
      'title': 'Segmented',
      'route': '/segmented',
      'screen': const SegmentedSampleScreen(),
    },
    {
      'title': 'Tab Component',
      'route': '/tabComponent',
      'screen': const TabPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Design System Samples')),
      body: ListView.builder(
        itemCount: samples.length,
        itemBuilder: (context, index) {
          final sample = samples[index];
          return ListTile(
            title: Text(sample['title']),
            onTap: () {
              Navigator.pushNamed(context, sample['route']);
            },
          );
        },
      ),
    );
  }
}
