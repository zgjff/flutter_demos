import 'package:flutter/material.dart';

part 'prefix_text_field_mode.dart';

/// 带前缀widget的输入框
class PrefixTextField extends StatelessWidget {
  const PrefixTextField({
    super.key,
    required this.prefix,
    required this.textField,
    this.mode = const PrefixTextFieldAutoMode(),
  });

  /// 前缀widget
  final Widget prefix;

  final Widget textField;

  /// 宽度规则: 默认`auto`
  final PrefixTextFieldMode mode;

  @override
  Widget build(BuildContext context) {
    if (mode.fixedWidth == 0 && mode.preFlex == 0 && mode.textFieldFlex == 0) {
      return Container(
        padding: EdgeInsets.zero,
        width: double.infinity,
        height: double.infinity,
        child: Row(
          children: [
            prefix,
            Expanded(child: textField),
          ],
        ),
      );
    }
    if (mode.fixedWidth > 0) {
      return Container(
        padding: EdgeInsets.zero,
        width: double.infinity,
        height: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: mode.fixedWidth, child: prefix),
            Expanded(child: textField),
          ],
        ),
      );
    }
    return Container(
      padding: EdgeInsets.zero,
      width: double.infinity,
      height: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: mode.preFlex,
            child: prefix,
          ),
          Expanded(
            flex: mode.textFieldFlex,
            child: textField,
          ),
        ],
      ),
    );
  }
}
