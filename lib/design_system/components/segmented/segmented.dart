import 'package:flutter/material.dart';
import 'segmented_view_model.dart';

class Segmented extends StatelessWidget {
  final SegmentedViewModel viewModel;

  const Segmented._({super.key, required this.viewModel});

  static Widget instantiate({required SegmentedViewModel viewModel}) {
    return Segmented._(viewModel: viewModel);
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

    return Container(
      width: 343,
      height: 32,
      padding: const EdgeInsets.all(2),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFE8ECEF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        children: viewModel.labels.asMap().entries.map((entry) {
          final index = entry.key;
          final label = entry.value;
          final isSelected = index == viewModel.selectedIndex;
          final width = (343 - 6) / viewModel.labels.length; // Distribui espaço

          return SizedBox(
            width: width, //Largura distribuída igualmente
            height: 28,
            child: InkWell(
              onTap: () => viewModel.onSelectedIndexChanged(index),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: ShapeDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(isSelected ? 6.93 : 0),
                    side: BorderSide(
                      width: 0.50,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: const Color(0xFFE8ECEF),
                    ),
                  ),
                  shadows: isSelected
                      ? [
                          BoxShadow(
                            color: const Color(0x0A000000),
                            blurRadius: 1,
                            offset: const Offset(0, 3),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: const Color(0x1E000000),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                            spreadRadius: 0,
                          ),
                        ]
                      : [],
                ),
                child: Center(
                  child: Text(
                    label,
                    style: isSelected ? selectedTextStyle : unselectedTextStyle,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
