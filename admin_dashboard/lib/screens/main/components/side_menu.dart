import 'package:admin_dashboard/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(child: Image.asset(Assets.imagesLogo)),
            DrawerListTile(
              title: 'Dashboard',
              svgSrc: Assets.iconsMenuDashboard,
              press: () {},
            ),
            DrawerListTile(
              title: 'Transaction',
              svgSrc: Assets.iconsMenuTran,
              press: () {},
            ),
            DrawerListTile(
              title: 'Task',
              svgSrc: Assets.iconsMenuTask,
              press: () {},
            ),
            DrawerListTile(
              title: 'Store',
              svgSrc: Assets.iconsMenuStore,
              press: () {},
            ),
            DrawerListTile(
              title: 'Notification',
              svgSrc: Assets.iconsMenuNotification,
              press: () {},
            ),
            DrawerListTile(
              title: 'Profile',
              svgSrc: Assets.iconsMenuProfile,
              press: () {},
            ),
            DrawerListTile(
              title: 'Settings',
              svgSrc: Assets.iconsMenuSetting,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {super.key,
      required this.title,
      required this.svgSrc,
      required this.press});

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 8.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
