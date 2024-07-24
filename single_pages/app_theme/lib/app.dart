import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'pages/root/index.dart';
import 'theme/index.dart';

Size get designSize {
  final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
  final logicalShortestSize =
      firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
  final logicalLongestSize =
      firstView.physicalSize.longestSide / firstView.devicePixelRatio;
  const scaleFactor = 0.95;
  return Size(
      logicalShortestSize * scaleFactor, logicalLongestSize * scaleFactor);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:
              Provider.of<ThemeProvider>(context, listen: false).lightTheme(),
          darkTheme:
              Provider.of<ThemeProvider>(context, listen: false).darkTheme(),
          themeMode:
              Provider.of<ThemeProvider>(context, listen: true).themeMode,
          home: const RootPage(),
        );
      },
    );
  }
}
