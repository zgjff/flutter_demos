import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class EdgeColorButton extends StatelessWidget {
  const EdgeColorButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.color = Colors.yellow,
    this.height = 60,
  });

  final String title;
  final Color color;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.only(left: 3, top: 3, right: 0, bottom: 0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(80)),
        border: Border.all(color: Colors.black),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(color)),
        child: Text(title)
            .textColor(Colors.black)
            .fontSize(18)
            .fontWeight(FontWeight.w600),
      ),
    );
  }
}
