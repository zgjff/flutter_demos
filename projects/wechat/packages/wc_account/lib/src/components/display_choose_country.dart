import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

/// 显示并选择国家地区组件
class DisplayChooseCountry extends StatelessWidget {
  final String currentCountry;
  final VoidCallback? onPressed;
  const DisplayChooseCountry({
    super.key,
    required this.currentCountry,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        textStyle:
            WidgetStateProperty.all(Theme.of(context).textTheme.labelMedium),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        overlayColor: WidgetStateProperty.all(Colors.blue),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text('国家/地区')
              .textStyle(Theme.of(context).textTheme.labelMedium!),
          const SizedBox(width: 25),
          Text(currentCountry)
              .textStyle(Theme.of(context).textTheme.labelMedium!),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 20,
            color: Color.fromRGBO(255, 255, 255, 0.4),
          )
        ],
      ),
    );
  }
}
