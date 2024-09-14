import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:wc_baseui/wc_baseui.dart';

/// 输入手机号+国家地区码
class InputCountryMobile extends StatelessWidget {
  const InputCountryMobile({
    super.key,
    required this.code,
  });

  /// 地区码
  final String code;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 5,
          child: const Text('手机号')
              .textStyle(Theme.of(context).textTheme.labelMedium!),
        ),
        Expanded(
          flex: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(code)
                  .textColor(const Color.fromRGBO(255, 255, 255, 0.6))
                  .fontSize(18)
                  .fontWeight(FontWeight.w600),
              const SizedBox(width: 16),
              const Expanded(
                child: CustomTextField(
                  decoration: InputDecoration(
                    hintText: "请填写手机号码",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.6),
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    suffixIcon: Icon(Icons.close_outlined),
                    counterText: '',
                  ),
                  suffixIconMode: TextFieldSuffixIconMode.whileContent,
                  suffixIconAction: TextFieldSuffixIconAction.clear,
                  keyboardType: TextInputType.number,
                  maxLength: 24,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
