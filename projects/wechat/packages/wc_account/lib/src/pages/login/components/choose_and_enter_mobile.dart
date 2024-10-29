import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:wc_baseui/wc_baseui.dart';

import 'display_choose_country.dart';
import 'input_country_mobile.dart';

/// 选择并输入手机号
class ChooseAndEnterMobile extends StatelessWidget {
  const ChooseAndEnterMobile({
    super.key,
    this.cityName,
    this.phoneCode,
    this.onTapCity,
    this.onChanged,
  });

  /// 国家名称
  final String? cityName;

  /// 电话区号
  final String? phoneCode;

  /// 点击国家地区
  final VoidCallback? onTapCity;

  /// 输入文字变化
  final ValueChanged<String>? onChanged;
  // final
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Divider(height: 1, color: Theme.of(context).dividerColor),
        ),
        SizedBox(
          height: 60,
          child: DisplayChooseCountry(
              currentCountry: cityName ?? "", onPressed: () {}),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Divider(height: 1, color: Theme.of(context).dividerColor),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 8),
          child: SizedBox(
            height: 60,
            child: InputCountryMobile(
              code: '+${phoneCode ?? ""}',
              onChanged: onChanged,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Divider(height: 1, color: Theme.of(context).dividerColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
              onPressed: onTapCity,
              style: const FillButtonPalette(
                background: ButtonStatePalette.all(Colors.transparent),
                padding: EdgeInsets.only(left: 12, top: 16, bottom: 16),
              ).style,
              child: const Text('使用其它方式登录')
                  .fontSize(17)
                  .textColor(const Color(0xFF457EE0))
                  .fontWeight(FontWeight.w700),
            ),
          ],
        ),
      ],
    );
  }
}
