import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class DeviceWifiSignal extends StatelessWidget {
  const DeviceWifiSignal({
    super.key,
    required this.icon,
    required this.name,
    required this.date,
    required this.signal,
    this.showDivider = true,
  });

  final IconData icon;
  final String name, date, signal;
  final bool showDivider;
  @override
  Widget build(BuildContext context) {
    const double iconSize = 60;
    const double iconTextSpace = 8;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: iconSize,
                height: iconSize,
                decoration: const BoxDecoration(
                  color: Color(0xffEBF1FF),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Icon(
                  icon,
                  size: 30,
                  color: const Color(0xff6695FF),
                ),
              ),
              const SizedBox(width: iconTextSpace),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(name)
                      .fontSize(18)
                      .fontWeight(FontWeight.w500)
                      .textColor(const Color(0xff161B3A)),
                  const SizedBox(height: 8),
                  Text(date)
                      .fontSize(13)
                      .fontWeight(FontWeight.w500)
                      .textColor(const Color(0xff61688B).withOpacity(0.5)),
                ],
              ).expanded(),
              const Icon(
                Icons.arrow_drop_up,
                color: Color(0xff77D977),
                size: 20,
              ),
              Text(signal)
                  .fontSize(13)
                  .fontWeight(FontWeight.w500)
                  .textColor(const Color(0xff61688B)),
              const SizedBox(width: 4),
              const Icon(
                Icons.signal_cellular_alt,
                color: Color(0xff77D977),
                size: 18,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Opacity(
            opacity: showDivider ? 1 : 0,
            child: Container(
              margin: const EdgeInsets.only(left: iconSize + iconTextSpace),
              height: 1,
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}
