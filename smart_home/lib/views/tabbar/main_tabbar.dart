import 'package:flutter/material.dart';

import '..//home/home_view.dart';

class MainTabBar extends StatefulWidget {
  const MainTabBar({super.key});

  @override
  State<MainTabBar> createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar>
    with SingleTickerProviderStateMixin {
  late TabController? _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
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
    print('Main Controller');
    return Scaffold(
      body: TabBarView(
        controller: _controller,
        children: const [
          HomeView(color: Colors.orange),
          HomeView(color: Colors.red),
          HomeView(color: Colors.yellow),
          HomeView(color: Colors.purple),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx) {
          _controller?.index = idx;
        },
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.lime,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.ice_skating), label: 'red'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'red'),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_contact_cal), label: 'red'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'red'),
        ],
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
