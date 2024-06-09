import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class BorderTextButton extends StatelessWidget {
  const BorderTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height = 60,
  });

  final String title;
  final double height;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(title)
            .textColor(Colors.black)
            .fontSize(18)
            .fontWeight(FontWeight.w600),
      ),
    );
  }
}
