import 'package:flutter/material.dart';

class ButtonStatePalette {
  /// 常态
  final Color normal;

  /// 选中
  final Color selected;

  /// 轻击或点击
  final Color press;

  /// 鼠标交互悬停时
  final Color hover;

  /// 焦点
  final Color focused;

  /// 不可交互
  final Color disabled;

  /// 赋值所有状态的颜色
  const ButtonStatePalette({
    required this.normal,
    required this.selected,
    required this.press,
    required this.hover,
    required this.focused,
    required this.disabled,
  });

  /// 所有状态颜色均为同一颜色
  const ButtonStatePalette.all(Color color)
      : normal = color,
        selected = color,
        press = color,
        hover = color,
        focused = color,
        disabled = color;

  /// 赋值`normal`颜色
  ///
  /// https://m2.material.io/design/interaction/states.html#anatomy
  ///
  /// `selected`颜色默认为`normal`颜色`Opacity`的0.08
  ///
  /// `press`颜色默认为`normal`颜色`Opacity`的0.55
  ///
  /// `hover`颜色默认为`normal`颜色`Opacity`的0.04
  ///
  /// `focused`颜色默认为`normal`颜色`Opacity`的0.12
  ///
  /// `disabled`颜色默认为`normal`颜色`Opacity`的0.38
  ButtonStatePalette.normal(this.normal)
      : selected = normal.withOpacity(0.08),
        press = normal.withOpacity(0.55),
        hover = normal.withOpacity(0.04),
        focused = normal.withOpacity(0.12),
        disabled = normal.withOpacity(0.38);

  /// 赋值`normal`, `press`颜色
  ///
  /// `selected`颜色默认为`normal`颜色`Opacity`的0.08
  ///
  /// `hover`颜色默认为`normal`颜色`Opacity`的0.04
  ///
  /// `focused`颜色默认为`normal`颜色`Opacity`的0.12
  ///
  /// `disabled`颜色默认为`normal`颜色`Opacity`的0.38
  ButtonStatePalette.np(this.normal, this.press)
      : selected = normal.withOpacity(0.08),
        hover = normal.withOpacity(0.04),
        focused = normal.withOpacity(0.12),
        disabled = normal.withOpacity(0.38);

  /// 赋值`normal`, `selected`颜色
  ///
  /// `press`颜色默认为`normal`颜色`Opacity`的0.55
  ///
  /// `hover`颜色默认为`normal`颜色`Opacity`的0.04
  ///
  /// `focused`颜色默认为`normal`颜色`Opacity`的0.12
  ///
  /// `disabled`颜色默认为`normal`颜色`Opacity`的0.38
  ButtonStatePalette.ns(this.normal, this.selected)
      : press = normal.withOpacity(0.55),
        hover = normal.withOpacity(0.04),
        focused = normal.withOpacity(0.12),
        disabled = normal.withOpacity(0.38);

  /// 赋值`normal`, `disabled`颜色
  ///
  /// `selected`颜色默认为`normal`颜色`Opacity`的0.08
  ///
  /// `press`颜色默认为`normal`颜色`Opacity`的0.12
  ///
  /// `hover`颜色默认为`normal`颜色`Opacity`的0.04
  ///
  /// `focused`颜色默认为`normal`颜色`Opacity`的0.12
  ButtonStatePalette.nd(this.normal, this.disabled)
      : selected = normal.withOpacity(0.08),
        press = normal.withOpacity(0.55),
        hover = normal.withOpacity(0.04),
        focused = normal.withOpacity(0.12);

  /// 赋值`normal`, `selected`, `disabled`颜色
  ///
  /// `press`颜色默认为`normal`颜色`Opacity`的0.55
  ///
  /// `hover`颜色默认为`normal`颜色`Opacity`的0.04
  ///
  /// `focused`颜色默认为`normal`颜色`Opacity`的0.12
  ButtonStatePalette.nsd(this.normal, this.selected, this.disabled)
      : press = normal.withOpacity(0.55),
        hover = normal.withOpacity(0.04),
        focused = normal.withOpacity(0.12);
}

abstract class ButtonPalette {
  final ButtonStatePalette background;
  final ButtonStatePalette? foreground;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final bool disable;

  const ButtonPalette({
    required this.background,
    this.foreground,
    required this.borderRadius,
    required this.padding,
    this.disable = false,
  });

  ButtonStyle get style;
}

final class FillButtonPalette extends ButtonPalette {
  final double elevation;
  const FillButtonPalette({
    required super.background,
    super.foreground,
    super.borderRadius = const BorderRadius.all(Radius.circular(8)),
    super.padding = const EdgeInsets.symmetric(vertical: 12),
    this.elevation = 0,
    super.disable,
  });

  @override
  ButtonStyle get style {
    Color? backgroundColor(Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled) || disable) {
        return background.disabled;
      }
      return background.normal;
    }

    Color? foregroundColor(Set<WidgetState> states) {
      if (foreground == null) {
        return null;
      }
      if (states.contains(WidgetState.disabled) || disable) {
        return background.disabled;
      }
      if (states.contains(WidgetState.selected)) {
        return foreground!.selected;
      }
      if (states.contains(WidgetState.pressed)) {
        return foreground!.press;
      }
      if (states.contains(WidgetState.hovered)) {
        return foreground!.hover;
      }
      if (states.contains(WidgetState.focused)) {
        return foreground!.focused;
      }
      return foreground!.normal;
    }

    Color? overlayColor(Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled) || disable) {
        return background.disabled;
      }
      if (states.contains(WidgetState.selected)) {
        return background.selected;
      }
      if (states.contains(WidgetState.pressed)) {
        return background.press;
      }
      if (states.contains(WidgetState.hovered)) {
        return background.hover;
      }
      if (states.contains(WidgetState.focused)) {
        return background.focused;
      }
      return background.normal;
    }

    return ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith(backgroundColor),
      foregroundColor: WidgetStateProperty.resolveWith(foregroundColor),
      overlayColor: WidgetStateProperty.resolveWith(overlayColor),
      elevation: WidgetStateProperty.all(elevation),
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: borderRadius)),
      padding: WidgetStateProperty.all(padding),
    );
  }
}
