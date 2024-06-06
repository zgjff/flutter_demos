import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class BackgroundTextButton extends StatelessWidget {
  const BackgroundTextButton({
    super.key,
    required this.title,
    this.color,
    this.horizontal,
    this.onPressed,
  });

  final String title;
  final Color? color;
  final double? horizontal;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: _buttonStyle(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(title).textColor(Colors.white).fontSize(18),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    if (horizontal != null) {
      return ButtonStyle(
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(horizontal: horizontal!),
        ),
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.all(color),
      );
    }
    return ButtonStyle(
      elevation: WidgetStateProperty.all(0),
      backgroundColor: WidgetStateProperty.all(color),
    );
  }
}
