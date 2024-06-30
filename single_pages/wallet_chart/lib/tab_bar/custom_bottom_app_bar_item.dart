import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class CustomBottomAppBarItem extends StatelessWidget {
  const CustomBottomAppBarItem({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    this.isSelected = false,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final Color color;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(
      icon,
      color: isSelected ? color : Colors.white,
    );
    if (!isSelected) {
      return InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: iconWidget,
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: const ShapeDecoration(
        color: Color.fromRGBO(47, 46, 57, 1),
        shape: StadiumBorder(
          side: BorderSide(
            color: Color.fromRGBO(47, 46, 57, 1),
          ),
        ),
        // borderRadius: BorderRadius
      ),
      child: [
        iconWidget,
        const SizedBox(
          width: 6,
        ),
        Text(title).fontSize(15).fontWeight(FontWeight.w800).textColor(color),
      ].toRow(),
    );
  }
}
