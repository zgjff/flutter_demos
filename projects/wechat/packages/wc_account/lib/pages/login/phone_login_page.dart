import 'package:flutter/material.dart';

class PhoneLoginPage extends StatelessWidget {
  const PhoneLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: Container(
        color: Colors.cyan,
      ),
    );
  }
}
