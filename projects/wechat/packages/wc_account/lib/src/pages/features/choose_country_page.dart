import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 选择国家地区
class ChooseCountryPage extends StatelessWidget {
  const ChooseCountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CupertinoSearchTextField(
              placeholder: '搜索',
            ),
          )
        ],
      ),
    );
  }

  PreferredSizeWidget _appbar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.close),
      ),
      title: Text('选择国家和地区'),
    );
  }
}
