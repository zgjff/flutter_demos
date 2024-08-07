import 'package:app_theme/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme/index.dart';

void main() {
  ThemeProviderGlobal.init().then(
    (_) => {
      runApp(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const MyApp(),
        ),
      ),
    },
  );
}
