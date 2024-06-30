import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class TitleInputField extends StatelessWidget {
  const TitleInputField({
    super.key,
    required this.title,
    this.hintText = '',
    this.obscureText = false,
  });

  final String title, hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title)
            .fontSize(15)
            .fontWeight(FontWeight.w400)
            .textColor(Colors.black87),
        const SizedBox(height: 5),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue[400]!),
            ),
          ),
        ),
      ],
    );
  }
}
