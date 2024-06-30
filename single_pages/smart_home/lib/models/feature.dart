import 'package:flutter/material.dart';

class Feature {
  const Feature({
    required this.icon,
    required this.title,
    required this.color,
  });
  final IconData icon;
  final String title;
  final Color color;
}

const List<Feature> features = [
  Feature(icon: Icons.lightbulb, title: "Light", color: Color(0xffFFCF4C)),
  Feature(icon: Icons.smart_display, title: "Media", color: Color(0xff81A1FF)),
  Feature(icon: Icons.videocam, title: "Camera", color: Color(0xffFF808E)),
  Feature(icon: Icons.wifi, title: "Wi-Fi", color: Color(0xff77D977)),
];
