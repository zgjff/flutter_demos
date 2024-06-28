import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_chart/tab_bar/tab_bar_cubit.dart';

import '../pages/pages.dart';
import 'custom_tab_bar.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _pages = const [
      HomePage(),
      DiscoverPage(),
      InfoPage(),
      SettingsPage(),
    ];
    _tabController = TabController(length: _pages.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _tabController = null;
    super.dispose();
  }

  late TabController? _tabController;
  late List<Widget> _pages;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabBarCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          bottomNavigationBar: BlocBuilder<TabBarCubit, TabBarState>(
            builder: (context, state) {
              return CustomTabBar(
                selectedIndex: _tabController!.index,
                onChanged: (index) {
                  _tabController?.index = index;
                  context.read<TabBarCubit>().change(index);
                },
              );
            },
          ),
          body: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: _pages,
          ),
        );
      }),
    );
  }
}
