import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import 'custom_bottom_app_bar_item.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    this.selectedIndex = 0,
    required this.onChanged,
  });

  final int selectedIndex;
  final void Function(int index) onChanged;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: [
        CustomBottomAppBarItem(
          icon: Icons.home,
          title: 'Home',
          color: Colors.white,
          isSelected: selectedIndex == 0,
          onTap: () {
            onChanged(0);
          },
        ),
        CustomBottomAppBarItem(
          icon: Icons.explore_outlined,
          title: 'Discover',
          color: Colors.pink,
          isSelected: selectedIndex == 1,
          onTap: () {
            onChanged(1);
          },
        ),
        CustomBottomAppBarItem(
          icon: Icons.data_usage,
          title: 'Info',
          color: Colors.orange,
          isSelected: selectedIndex == 2,
          onTap: () {
            onChanged(2);
          },
        ),
        CustomBottomAppBarItem(
          icon: Icons.settings,
          title: 'Settings',
          color: Colors.teal,
          isSelected: selectedIndex == 3,
          onTap: () {
            onChanged(3);
          },
        ),
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround),
    );
  }
}
