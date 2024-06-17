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
      ),
      home: const MainTabBar(),
    );
  }
}
