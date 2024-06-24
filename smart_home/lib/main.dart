import 'package:flutter/material.dart';

import 'views/tabbar/main_tabbar.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xff6695FF),
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[100],
          iconTheme: const IconThemeData(
            size: 25,
            color: Color(0xff61688B),
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Color(0xff161B3A),
            fontSize: 36,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const MainTabBar(),
    );
  }
}
