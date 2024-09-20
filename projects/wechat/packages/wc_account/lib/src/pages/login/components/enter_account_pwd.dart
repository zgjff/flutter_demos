import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:wc_baseui/wc_baseui.dart';

/// 输入账号密码
class EnterAccountPwd extends StatelessWidget {
  const EnterAccountPwd({
    super.key,
    this.onTapMobile,
  });

  /// 手机号登录
  final VoidCallback? onTapMobile;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Divider(height: 1, color: Theme.of(context).dividerColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            height: 60,
            child: PrefixTextField(
              prefix: const Text('账号')
                  .textStyle(Theme.of(context).textTheme.labelMedium!),
              textField: const CustomTextField(
                decoration: InputDecoration(
                  hintText: "微信号/QQ号/邮箱",
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  suffixIcon: Icon(Icons.close_outlined),
                  counterText: '',
                ),
                suffixIconMode: TextFieldSuffixIconMode.whileContent,
                suffixIconAction: TextFieldSuffixIconAction.clear,
                maxLength: 24,
              ),
              mode: const PrefixTextFieldFixedMode(55),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Divider(height: 1, color: Theme.of(context).dividerColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            height: 60,
            child: PrefixTextField(
              prefix: const Text('密码')
                  .textStyle(Theme.of(context).textTheme.labelMedium!),
              textField: const CustomTextField(
                decoration: InputDecoration(
                  hintText: "请填写密码",
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  suffixIcon: Icon(Icons.close_outlined),
                  counterText: '',
                ),
                suffixIconMode: TextFieldSuffixIconMode.whileContent,
                suffixIconAction: TextFieldSuffixIconAction.clear,
                maxLength: 24,
              ),
              mode: const PrefixTextFieldFixedMode(55),
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
              onPressed: onTapMobile,
              style: const FillButtonPalette(
                background: ButtonStatePalette.all(Colors.transparent),
                padding: EdgeInsets.only(left: 12, top: 16, bottom: 16),
              ).style,
              child: const Text('用手机号登录')
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
