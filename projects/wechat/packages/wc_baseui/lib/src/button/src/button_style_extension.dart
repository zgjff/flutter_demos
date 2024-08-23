import 'package:flutter/material.dart';

/// 链式调用
extension ButtonStyleDSL on ButtonStyle {
  ButtonStyle get bold {
    return copyWith(
        textStyle: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (textStyle == null) {
        return const TextStyle(fontWeight: FontWeight.bold);
      }
      final current = textStyle!.resolve(states);
      if (current == null) {
        return const TextStyle(fontWeight: FontWeight.bold);
      }
      return current.copyWith(fontWeight: FontWeight.bold);
    }));
  }

  ButtonStyle get italic {
    return copyWith(
        textStyle: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (textStyle == null) {
        return const TextStyle(fontStyle: FontStyle.italic);
      }
      final current = textStyle!.resolve(states);
      if (current == null) {
        return const TextStyle(fontStyle: FontStyle.italic);
      }
      return current.copyWith(fontStyle: FontStyle.italic);
    }));
  }

  ButtonStyle fontWeight(FontWeight? fontWeight) {
    return copyWith(
        textStyle: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (textStyle == null) {
        return TextStyle(fontWeight: fontWeight);
      }
      final current = textStyle!.resolve(states);
      if (current == null) {
        return TextStyle(fontWeight: fontWeight);
      }
      return current.copyWith(fontWeight: fontWeight);
    }));
  }

  ButtonStyle fontSize(double? size) {
    return copyWith(
        textStyle: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (textStyle == null) {
        return TextStyle(fontSize: size);
      }
      final current = textStyle!.resolve(states);
      if (current == null) {
        return TextStyle(fontSize: size);
      }
      return current.copyWith(fontSize: size);
    }));
  }

  ButtonStyle fontFamily(String? font) {
    return copyWith(
        textStyle: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (textStyle == null) {
        return TextStyle(fontFamily: font);
      }
      final current = textStyle!.resolve(states);
      if (current == null) {
        return TextStyle(fontFamily: font);
      }
      return current.copyWith(fontFamily: font);
    }));
  }

  ButtonStyle allPadding(EdgeInsetsGeometry? padding) =>
      copyWith(padding: WidgetStateProperty.resolveWith((_) => padding));

  ButtonStyle allShape(OutlinedBorder? border) =>
      copyWith(shape: WidgetStateProperty.resolveWith((_) => border));

  ButtonStyle allElevation(double? elevation) =>
      copyWith(elevation: WidgetStateProperty.resolveWith((_) => elevation));

  ButtonStyle allSide(BorderSide? side) =>
      copyWith(side: WidgetStateProperty.resolveWith((_) => side));
}
