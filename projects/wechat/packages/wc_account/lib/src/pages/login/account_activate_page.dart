import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wc_baseui/wc_baseui.dart';
import 'package:wc_services/wc_services.dart';

import '../../generated/assets.dart';

/// 登录注册启动页面
class AccountActivatePage extends StatelessWidget {
  const AccountActivatePage({super.key});

  void _gotoLogin(BuildContext context) {
    context.push(RouterPath.login.fullPath);
  }

  void _gotoRegister(BuildContext context) {
    context.push(RouterPath.login.fullPath);
  }

  @override
  Widget build(BuildContext context) {
    const double edgeSpace = 24;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              textStyle: WidgetStateProperty.all(
                const TextStyle(
                  fontSize: 16,
                ),
              ),
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              foregroundColor: WidgetStateProperty.all(
                  const Color.fromRGBO(255, 255, 255, 0.7)),
              splashFactory: NoSplash.splashFactory,
            ),
            child: const Text('简体中文'),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(
            left: edgeSpace, right: edgeSpace, bottom: edgeSpace),
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesLaunchImage, package: 'wc_account'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    _gotoLogin(context);
                  },
                  style: FillButtonPalette(
                    background: ButtonStatePalette.normal(
                        const Color.fromARGB(1, 21, 29, 40)),
                    foreground: ButtonStatePalette.normal(Colors.white),
                  ).style.fontSize(18).bold,
                  child: const Text('登录'),
                ),
              ),
              const SizedBox(width: edgeSpace),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    _gotoRegister(context);
                  },
                  style: FillButtonPalette(
                    background: ButtonStatePalette.normal(
                        Theme.of(context).colorScheme.primary),
                    foreground: ButtonStatePalette.normal(Colors.white),
                  ).style.fontSize(18).bold,
                  child: const Text('注册'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
