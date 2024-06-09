import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../widgets/edge_color_button.dart';
import '../widgets/title_inputField.dart';
import './login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key, this.fromLogin = false});

  final bool fromLogin;
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
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      const Text('Sign up')
                          .textColor(Colors.black)
                          .fontWeight(FontWeight.bold)
                          .fontSize(30),
                      const SizedBox(height: 18),
                      const Text('Create an account, It is free')
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
                      const SizedBox(height: 30),
                      const TitleInputField(
                        title: 'Confirm Password',
                        obscureText: true,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  EdgeColorButton(
                    onPressed: () {},
                    title: 'Sign up',
                    color: Colors.greenAccent,
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      InkWell(
                        onTap: () {
                          if (fromLogin) {
                            Navigator.of(context).pop();
                            return;
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const LoginScreen(fromSignup: true)),
                          );
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: const Text('Login')
                            .fontWeight(FontWeight.w600)
                            .fontSize(18),
                      ),
                    ],
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
