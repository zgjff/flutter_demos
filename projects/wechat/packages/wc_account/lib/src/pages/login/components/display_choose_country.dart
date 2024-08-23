import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

/// 显示并选择国家地区组件
class DisplayChooseCountry extends StatelessWidget {
  const DisplayChooseCountry({
    super.key,
    required this.currentCountry,
    required this.onPressed,
  });

  /// 国家名称
  final String currentCountry;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        textStyle:
            WidgetStateProperty.all(Theme.of(context).textTheme.labelMedium),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        overlayColor:
            WidgetStateProperty.all(const Color.fromRGBO(255, 255, 255, 0.1)),
      ),
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.center,
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 5,
            child: const Text('国家/地区')
                .textStyle(Theme.of(context).textTheme.labelMedium!),
          ),
          Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(currentCountry)
                      .textStyle(Theme.of(context).textTheme.labelMedium!),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: Color.fromRGBO(255, 255, 255, 0.4),
                  )
                ],
              ))
          // const SizedBox(width: 25),
        ],
      ),
    );
  }
}
