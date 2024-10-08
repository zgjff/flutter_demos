import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import 'components/components.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 0, top: 40),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('手机号登录')
                        .textStyle(Theme.of(context).textTheme.labelLarge!),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 50),
              ),
              SliverToBoxAdapter(
                child: ChooseAndEnterMobile(
                  onTapCity: () {},
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: SafeArea(
                  minimum: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LoginPageBottom(
                        currentLoginStyleDesc: '上述手机号仅用于登录验证',
                        onTapLogin: () {},
                        onTapFindPwdLogin: () {},
                        onTapMoreLogin: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
