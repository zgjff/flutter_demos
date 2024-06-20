import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '..//home/home_view.dart';

class MainTabBar extends StatefulWidget {
  const MainTabBar({super.key});

  @override
  State<MainTabBar> createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> with TickerProviderStateMixin {
  late TabController? _controller;
  int _currentIndex = 0;
  late List<Widget> pages;
  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
    pages = [const HomeView(), const HomeView()];
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
        children: pages,
      ),
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          onPressed: () {},
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
          elevation: 0,
          child: const Icon(
            Icons.mic,
            size: 35,
          ),
        ).fittedBox(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        clipBehavior: Clip.hardEdge,
        notchMargin: 12,
        elevation: 10,
        shape: const CircularNotchedRectangle(),
        child: [
          _tabBarItem(context, Icons.home_filled, 0),
          _tabBarItem(context, Icons.settings, 1),
        ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround),
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

  IconButton _tabBarItem(BuildContext context, IconData icon, int index) {
    return IconButton(
      onPressed: () {
        _controller?.index = index;
      },
      isSelected: _currentIndex == index,
      icon: Icon(
        icon,
        size: 30,
        color: _currentIndex == index
            ? Theme.of(context).primaryColor
            : const Color(0xff61688B),
      ),
    );
  }
}
