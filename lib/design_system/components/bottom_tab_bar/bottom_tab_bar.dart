import 'package:flutter/material.dart';

import '../../shared/colors.dart';
import 'bottom_tab_bar_view_model.dart';

class BottomTabBar extends StatelessWidget {
  final BottomTabBarViewModel viewModel;
  final int currentIndex;

  const BottomTabBar._(
      {super.key, required this.viewModel, required this.currentIndex});

  static Widget instantiate(
      {required BottomTabBarViewModel viewModel, required int currentIndex}) {
    return BottomTabBar._(viewModel: viewModel, currentIndex: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: viewModel.bottomTabs,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: darkPrimaryBrandColor,
      unselectedItemColor: darkPrimaryBaseColorLight,
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      onTap: viewModel.onIndexChanged,
    );
  }
}
