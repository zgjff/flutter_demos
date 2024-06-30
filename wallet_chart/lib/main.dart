import 'package:flutter/material.dart';

import 'tab_bar/tab_bar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        scaffoldBackgroundColor: const Color(0xff161621),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff161621),
          iconTheme: IconThemeData(
            color: Colors.blueGrey,
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Color(0xff161621),
        ),
      ),
      home: const TabBarPage(),
    );
  }
}
