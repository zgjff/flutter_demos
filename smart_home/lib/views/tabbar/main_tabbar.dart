import 'package:flutter/material.dart';

import '..//home/home_view.dart';

class MainTabBar extends StatefulWidget {
  const MainTabBar({super.key});

  @override
  State<MainTabBar> createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> with TickerProviderStateMixin {
  late TabController? _controller;
  int _currentIndex = 0;
  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
    _controller?.addListener(_tabBarControllerListen);
  }

  @override
  void dispose() {
    _controller?.removeListener(_tabBarControllerListen);
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _controller,
        children: const [
          HomeView(color: Colors.grey),
          HomeView(color: Colors.white60)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        elevation: 0,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        clipBehavior: Clip.hardEdge,
        notchMargin: 18,
        elevation: 20,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                _controller?.index = 0;
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                _controller?.index = 1;
              },
            ),
          ],
        ),
      ),
    );
  }

  void _tabBarControllerListen() {
    if (!mounted || _controller == null) {
      return;
    }
    if (_controller!.index.toDouble() != _controller!.animation!.value) {
      return;
    }
    setState(() {
      _currentIndex = _controller!.index;
    });
  }
}
