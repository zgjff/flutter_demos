import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    this.onTap,
  });

  final String title, subTitle, icon;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 5, top: 25, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[350]!, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title)
              .textStyle(Theme.of(context).textTheme.titleLarge!)
              .fontSize(19),
          const SizedBox(height: 5),
          Text(subTitle)
              .textStyle(Theme.of(context).textTheme.titleLarge!)
              .fontSize(19),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                icon,
                width: 80,
                height: 80,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
