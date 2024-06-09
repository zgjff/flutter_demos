import 'package:account_flow/generated/assets.dart';
import 'package:account_flow/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
    this.fromSignup = false,
  });

  final bool fromSignup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 40, right: 40, bottom: 30),
                child: Column(
                  children: [
                    const Text('Login')
                        .textColor(Colors.black)
                        .fontWeight(FontWeight.bold)
                        .fontSize(30),
                    const SizedBox(height: 18),
                    const Text('Login to your account')
                        .textAlignment(TextAlign.center)
                        .textColor(Colors.grey[700])
                        .fontSize(15),
                    const SizedBox(height: 30),
                    const TitleInputField(
                      title: 'Email',
                    ),
                    const SizedBox(height: 30),
                    const TitleInputField(
                      title: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 60),
                    EdgeColorButton(
                      onPressed: () {},
                      title: 'Login',
                      color: Colors.greenAccent,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Do not have an account?'),
                        InkWell(
                          onTap: () {
                            if (fromSignup) {
                              Navigator.of(context).pop();
                              return;
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      const SignupScreen(fromLogin: true)),
                            );
                          },
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: const Text('Sign up')
                              .fontWeight(FontWeight.w600)
                              .fontSize(18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Image.asset(Assets.assetsBackground),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
