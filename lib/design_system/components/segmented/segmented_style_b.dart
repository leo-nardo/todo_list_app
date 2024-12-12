import 'package:flutter/material.dart';
import 'segmented_view_model.dart';

class SegmentedStyleB extends StatelessWidget {
  final SegmentedViewModel viewModel;

  const SegmentedStyleB._({super.key, required this.viewModel});

  static Widget instantiate({required SegmentedViewModel viewModel}) {
    return SegmentedStyleB._(viewModel: viewModel);
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle selectedTextStyle = const TextStyle(
      color: Color(0xFF0070EA),
      fontSize: 16,
      fontFamily: 'Galano Telepass',
      fontWeight: FontWeight.w600,
      height: 0.09,
    );
    final TextStyle unselectedTextStyle = const TextStyle(
      color: Color(0xFF002752),
      fontSize: 16,
      fontFamily: 'Galano Telepass',
      fontWeight: FontWeight.w400,
      height: 0.09,
    );

    final totalWidth = 360.0;
    final tabSpacing = 8.0;
    final tabCount = viewModel.labels.length;
    final availableWidth = totalWidth - (tabSpacing * (tabCount - 1));
    final tabWidth = availableWidth / tabCount;
    final indicatorWidth = tabWidth;
    final indicatorHeight = 2.4;

    return Container(
      width: totalWidth,
      height: 60,
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          ...viewModel.labels.asMap().entries.map((entry) {
            final index = entry.key;
            final label = entry.value;
            final isSelected = index == viewModel.selectedIndex;
            final left = index * (tabWidth + tabSpacing);

            return Positioned(
              left: left,
              top: 18,
              child: SizedBox(
                width: tabWidth,
                height: 34, //altura suficiente para o inkwell funcionar
                child: InkWell(
                  onTap: () => viewModel.onSelectedIndexChanged(index),
                  child: Center(
                    // Centraliza o texto dentro do InkWell
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style:
                          isSelected ? selectedTextStyle : unselectedTextStyle,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
          Positioned(
            left: viewModel.selectedIndex * (tabWidth + tabSpacing),
            bottom: 0,
            child: SizedBox(
              width: indicatorWidth,
              height: indicatorHeight,
              child: Container(
                decoration: BoxDecoration(color: const Color(0xFF0070EA)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
