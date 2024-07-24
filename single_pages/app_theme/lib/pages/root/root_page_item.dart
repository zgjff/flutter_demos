import 'package:flutter/material.dart';

import '../home/index.dart';
import '../profile/index.dart';

final class RootPageItem {
  final String title;
  final IconData iconData;
  final Widget page;

  const RootPageItem({
    required this.title,
    required this.iconData,
    required this.page,
  });

  static List<RootPageItem> pages() {
    return const [
      RootPageItem(
        title: 'Home',
        iconData: Icons.home,
        page: HomePage(),
      ),
      RootPageItem(
        title: 'Profile',
        iconData: Icons.person,
        page: ProfilePage(),
      ),
    ];
  }
}
