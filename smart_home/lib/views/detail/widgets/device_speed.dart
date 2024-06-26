import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class DeviceSpeed extends StatelessWidget {
  const DeviceSpeed({
    super.key,
    required this.title,
    required this.bgColor,
    required this.icon,
    required this.speed,
  });

  final String title;
  final Color bgColor;
  final IconData icon;
  final String speed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title)
              .textColor(Colors.white)
              .fontSize(15)
              .fontWeight(FontWeight.w700),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(speed, overflow: TextOverflow.ellipsis)
                  .textColor(Colors.white)
                  .fontSize(17)
                  .fontWeight(FontWeight.w800)
                  .expanded(),
              Container(
                width: 35,
                height: 35,
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: bgColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
