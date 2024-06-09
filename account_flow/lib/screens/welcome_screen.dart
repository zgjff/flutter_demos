import 'package:account_flow/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../widgets/widgets.dart';
import 'screens.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: <Widget>[
                  const Text('Welcome')
                      .textColor(Colors.black)
                      .fontWeight(FontWeight.bold)
                      .fontSize(30),
                  const SizedBox(height: 20),
                  const Text(
                          'Automatic identity verification which enables you to verify your identity')
                      .textAlignment(TextAlign.center)
                      .textColor(Colors.grey[700])
                      .fontSize(15),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.assetsIllustration))),
              ),
              Column(
                children: [
                  BorderTextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    title: 'Login',
                  ),
                  const SizedBox(height: 20),
                  EdgeColorButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignupScreen()),
                      );
                    },
                    title: 'Sign up',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
