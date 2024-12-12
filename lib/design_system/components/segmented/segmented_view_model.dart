import 'package:flutter/material.dart';

class SegmentedViewModel {
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelectedIndexChanged;

  SegmentedViewModel({
    required this.labels,
    required this.selectedIndex,
    required this.onSelectedIndexChanged,
  });
}
