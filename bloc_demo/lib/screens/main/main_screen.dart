import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Container(
        width: 300,
        height: 300,
        color: sizingInformation.isMobile ? Colors.red : Colors.orange,
      );
    });
  }
}
// ResponsiveApp
