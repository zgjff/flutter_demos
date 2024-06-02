import 'package:admin_dashboard/constants.dart';
import 'package:admin_dashboard/responsive.dart';
import 'package:admin_dashboard/screens/dashboard/components/header.dart';
import 'package:admin_dashboard/screens/dashboard/components/my_files.dart';
import 'package:admin_dashboard/screens/dashboard/components/recent_files.dart';
import 'package:admin_dashboard/screens/dashboard/components/storage_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final useSafeArea = !Responsive.isMobile(context);
    return SafeArea(
      bottom: useSafeArea,
      top: useSafeArea,
      left: useSafeArea,
      right: useSafeArea,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const MyFiles(),
                      const SizedBox(height: defaultPadding),
                      const RecentFiles(),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) const StorageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),
                if (!Responsive.isMobile(context))
                  const Expanded(
                    flex: 2,
                    child: StorageDetails(),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
