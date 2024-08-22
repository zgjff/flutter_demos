import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:wc_account/src/components/display_choose_country.dart';

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
              const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 40),
          child: Column(
            children: [
              const Text('手机号登录')
                  .textStyle(Theme.of(context).textTheme.labelLarge!),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child:
                    Divider(height: 1, color: Theme.of(context).dividerColor),
              ),
              DisplayChooseCountry(currentCountry: '美国', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
