import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:wc_baseui/wc_baseui.dart';

class LoginPageBottom extends StatelessWidget {
  const LoginPageBottom({
    super.key,
    required this.currentLoginStyleDesc,
    required this.onTapLogin,
    required this.onTapFindPwdLogin,
    required this.onTapMoreLogin,
  });

  /// 当前登录描述
  final String currentLoginStyleDesc;
  final VoidCallback onTapLogin;
  final VoidCallback onTapFindPwdLogin;
  final VoidCallback onTapMoreLogin;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(currentLoginStyleDesc)
            .textColor(const Color.fromRGBO(255, 255, 255, 0.6))
            .fontSize(17)
            .fontWeight(FontWeight.w600),
        const SizedBox(height: 24),
        TextButton(
          onPressed: onTapLogin,
          style: FillButtonPalette(
            background: ButtonStatePalette.normal(
                Theme.of(context).colorScheme.primary),
            foreground: ButtonStatePalette.normal(Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 74, vertical: 14),
          ).style.fontSize(20).bold,
          child: const Text('同意并继续'),
        ),
        const SizedBox(height: 44),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: onTapFindPwdLogin,
              style: FillButtonPalette(
                background: ButtonStatePalette.normal(Colors.transparent),
                foreground: ButtonStatePalette.normal(const Color(0xFF457EE0)),
              ).style.fontSize(17).bold,
              child: const Text('找回密码'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                width: 1,
                height: 12,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey),
                ),
              ),
            ),
            TextButton(
                onPressed: onTapMoreLogin,
                style: FillButtonPalette(
                  background: ButtonStatePalette.normal(Colors.transparent),
                  foreground:
                      ButtonStatePalette.normal(const Color(0xFF457EE0)),
                ).style.fontSize(17).bold,
                child: const Text('更多选项')),
          ],
        ),
      ],
    );
  }
}
