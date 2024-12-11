import 'package:flutter/material.dart';

import '../../components/segmented/segmented.dart';
import '../../components/segmented/segmented_style_b.dart';
import '../../components/segmented/segmented_view_model.dart';

class SegmentedSampleScreen extends StatefulWidget {
  const SegmentedSampleScreen({super.key});

  @override
  State<SegmentedSampleScreen> createState() => _SegmentedSampleScreenState();
}

class _SegmentedSampleScreenState extends State<SegmentedSampleScreen> {
  int _selectedIndexStyleA = 0;
  int _selectedIndexStyleB = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segmented Examples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Segmented Style A
            const SizedBox(height: 20),
            Text('Segmented Style A',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Segmented.instantiate(
              viewModel: SegmentedViewModel(
                labels: ['Tab 1', 'Tab 2', 'Tab 3'],
                selectedIndex: _selectedIndexStyleA,
                onSelectedIndexChanged: (index) {
                  setState(() {
                    _selectedIndexStyleA = index;
                  });
                },
              ),
            ),

            // Segmented Style B
            const SizedBox(height: 20),
            Text('Segmented Style B',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SegmentedStyleB.instantiate(
              viewModel: SegmentedViewModel(
                labels: ['Tab 1', 'Tab 2', 'Tab 3'],
                selectedIndex: _selectedIndexStyleB,
                onSelectedIndexChanged: (index) {
                  setState(() {
                    _selectedIndexStyleB = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),

            // Segmented Style A - 2 abas
            const SizedBox(height: 20),
            Text('Segmented Style A - 2 abas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Segmented.instantiate(
              viewModel: SegmentedViewModel(
                labels: ['Tab 1', 'Tab 2'],
                selectedIndex: _selectedIndexStyleA,
                onSelectedIndexChanged: (index) {
                  setState(() {
                    _selectedIndexStyleA = index;
                  });
                },
              ),
            ),

            // Segmented Style B - 2 abas
            const SizedBox(height: 20),
            Text('Segmented Style B - 2 abas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SegmentedStyleB.instantiate(
              viewModel: SegmentedViewModel(
                labels: ['Tab 1', 'Tab 2'],
                selectedIndex: _selectedIndexStyleB,
                onSelectedIndexChanged: (index) {
                  setState(() {
                    _selectedIndexStyleB = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
