import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientLogin(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const LoginTip(),
            const SizedBox(height: 20),
            LoginRadiusCard(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 60),
                          const IntputCard(),
                          const SizedBox(height: 40),
                          const Text('Forgot Password?').textColor(Colors.grey),
                          const SizedBox(height: 40),
                          BackgroundTextButton(
                            title: 'Login',
                            color: Colors.orange[900],
                            horizontal: 90,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SocialLogin(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
