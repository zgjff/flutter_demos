import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class FeatureWidget extends StatelessWidget {
  const FeatureWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final Color color;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[350]!,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                height: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Text(title, overflow: TextOverflow.ellipsis)
                .fontSize(16)
                .fontWeight(FontWeight.w500)
                .textColor(const Color(0xff61688B))
                .expanded(),
          ],
        ),
      ),
    );
  }
}
