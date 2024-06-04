import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class LoginTip extends StatelessWidget {
  const LoginTip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Login')
              .textColor(Theme.of(context).textTheme.titleLarge?.color)
              .fontSize(40),
          const Text('Welcome Back')
              .textColor(Theme.of(context).textTheme.titleLarge?.color)
              .fontSize(18),
        ],
      ),
    );
  }
}
