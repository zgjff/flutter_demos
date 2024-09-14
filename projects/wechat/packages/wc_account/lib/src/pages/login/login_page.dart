import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:wc_baseui/wc_baseui.dart';

import 'components/components.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 40),
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
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Divider(
                          height: 1, color: Theme.of(context).dividerColor),
                    ),
                    SizedBox(
                      height: 60,
                      child: DisplayChooseCountry(
                          currentCountry: '美国', onPressed: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Divider(
                          height: 1, color: Theme.of(context).dividerColor),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: SizedBox(
                        height: 60,
                        child: InputCountryMobile(code: '+1'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Divider(
                          height: 1, color: Theme.of(context).dividerColor),
                    ),

                    // const Spacer(),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: TextButton(
                  onPressed: () {},
                  style: const FillButtonPalette(
                    background: ButtonStatePalette.all(Colors.transparent),
                    padding: EdgeInsets.only(left: 12, top: 16, bottom: 16),
                  ).style,
                  child: const Text('使用其它方式登录')
                      .fontSize(17)
                      .textColor(const Color(0xFF457EE0))
                      .fontWeight(FontWeight.w700),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
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
            ],
          ),
        ),
      ),
    );
  }
}
