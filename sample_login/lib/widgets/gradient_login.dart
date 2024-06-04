import 'package:flutter/material.dart';

class GradientLogin extends StatelessWidget {
  const GradientLogin({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topCenter,
          colors: [
            Colors.orange[900]!,
            Colors.orange[800]!,
            Colors.orange[400]!,
          ],
        ),
      ),
      child: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: child,
      ),
    );
  }
}
