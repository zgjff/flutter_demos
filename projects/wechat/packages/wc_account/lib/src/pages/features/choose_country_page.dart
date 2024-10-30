import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wc_account/src/models/country_region_phone_code.dart';

/// 选择国家地区
class ChooseCountryPage extends StatefulWidget {
  const ChooseCountryPage({
    super.key,
    this.onChoose,
  });

  final ValueChanged<CountryRegionPhoneCode>? onChoose;

  @override
  State<ChooseCountryPage> createState() => _ChooseCountryPageState();
}

class _ChooseCountryPageState extends State<ChooseCountryPage> {
  @override
  void initState() {
    super.initState();
  }

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
