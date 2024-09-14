import 'package:flutter/material.dart';

part 'suffix_icon_mode.dart';

/// app自定义输入框
///
/// 关于`decoration`的`suffixIcon`: 不要设置`button`, 内部会处理, 建议设置不能处理手势的`widget`
class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.style,
    this.obscureText = false,
    this.decoration,
    this.defaultText,
    this.suffixIconMode = TextFieldSuffixIconMode.never,
    this.suffixIconAction = TextFieldSuffixIconAction.clear,
    this.maxLength = 100,
    this.onChanged,
    this.onEndEditing,
    this.onTapSuffixIcon,
  });

  final TextEditingController? controller;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final bool obscureText;
  final TextFieldSuffixIconMode suffixIconMode;
  final TextFieldSuffixIconAction suffixIconAction;

  /// 输入文字变化
  final ValueChanged<String>? onChanged;

  /// 结束输入: 输入框失去焦点
  final ValueChanged<String>? onEndEditing;

  /// 点击`suffixIcon`事件
  final VoidCallback? onTapSuffixIcon;
  final String? defaultText;
  final int maxLength;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;
  late InputDecoration _decoration;
  late FocusNode _focusNode;
  late Widget? _suffixIcon;
  late bool displaySuffixIcon;
  late bool _obscureText;
  @override
  void initState() {
    _obscureText = widget.obscureText;
    _focusNode = FocusNode();
    // MARK: - TextEditingController
    TextEditingValue value;
    if (widget.defaultText == null) {
      value = const TextEditingValue();
    } else {
      final text = widget.defaultText!.trim();
      value = TextEditingValue(
        text: text,
        selection: TextSelection.fromPosition(
          TextPosition(
            affinity: TextAffinity.downstream,
            offset: text.length,
          ),
        ),
      );
    }
    if (widget.controller != null) {
      _controller = widget.controller!;
      _controller.value = value;
    } else {
      _controller = TextEditingController.fromValue(value);
    }

    // MARK: - InputDecoration
    if (widget.decoration != null &&
        widget.decoration!.suffixIcon != null &&
        ![TextFieldSuffixIconMode.never].contains(widget.suffixIconMode)) {
      _suffixIcon = InkWell(
        onTap: _handleSuffixIconAction,
        child: widget.decoration?.suffixIcon,
      );
    }

    if (widget.suffixIconMode == TextFieldSuffixIconMode.never) {
      if (widget.decoration == null) {
        _decoration = const InputDecoration();
      } else {
        _decoration = widget.decoration!.copyWith(
          suffixIcon: const SizedBox(
            width: 1,
            height: 1,
          ),
          suffixIconConstraints:
              const BoxConstraints(minWidth: 8, minHeight: 8),
        );
      }
      displaySuffixIcon = false;
    } else {
      if (widget.decoration != null) {
        _decoration = widget.decoration!.copyWith(suffixIcon: _suffixIcon);
      } else {
        _decoration = InputDecoration(suffixIcon: _suffixIcon);
      }
      displaySuffixIcon = true;
    }
    _handleSuffixIcon(widget.defaultText ?? "", false, _focusNode.hasFocus);

    super.initState();
    _focusNode.addListener(_handleFocusChange);
    _controller.addListener(_handleControllerChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleControllerChange);
    _controller.dispose();
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleControllerChange() {
    final text = _controller.text;
    widget.onChanged?.call(text.trim());
    _handleSuffixIcon(text, true, _focusNode.hasFocus);
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus) {
      widget.onEndEditing?.call(_controller.text.trim());
    }
    _handleSuffixIcon(_controller.text, true, _focusNode.hasFocus);
  }

  void _handleSuffixIcon(String text, bool changedText, bool isEditing) {
    bool needShow;
    switch (widget.suffixIconMode) {
      case TextFieldSuffixIconMode.always:
        needShow = true;
        break;
      case TextFieldSuffixIconMode.never:
        needShow = false;
        break;
      case TextFieldSuffixIconMode.whileEditing:
        needShow = isEditing;
        break;
      case TextFieldSuffixIconMode.unlessEditing:
        needShow = !isEditing;
        break;
      case TextFieldSuffixIconMode.whileContent:
        needShow = text.trim().isNotEmpty;
        break;
    }
    if (needShow && !displaySuffixIcon && _suffixIcon != null) {
      if (changedText) {
        setState(() {
          _decoration = _decoration.copyWith(
              suffixIcon: _suffixIcon,
              suffixIconConstraints:
                  const BoxConstraints(minWidth: 0, minHeight: 0));
        });
      } else {
        _decoration = _decoration.copyWith(
            suffixIcon: _suffixIcon,
            suffixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0));
      }
    } else if (!needShow && displaySuffixIcon) {
      const suffixIcon = SizedBox(width: 1, height: 1);
      const bc = BoxConstraints(minWidth: 8, minHeight: 8);
      if (changedText) {
        setState(() {
          _decoration = _decoration.copyWith(
            suffixIcon: suffixIcon,
            suffixIconConstraints: bc,
          );
        });
      } else {
        _decoration = _decoration.copyWith(
          suffixIcon: suffixIcon,
          suffixIconConstraints: bc,
        );
      }
    }
    displaySuffixIcon = needShow;
  }

  void _handleSuffixIconAction() {
    switch (widget.suffixIconAction) {
      case TextFieldSuffixIconAction.clear:
        _controller.clear();
        return;
      case TextFieldSuffixIconAction.oppositeObscure:
        setState(() {
          _obscureText = !_obscureText;
        });
        return;
      case TextFieldSuffixIconAction.custom:
        if (widget.onTapSuffixIcon != null) {
          widget.onTapSuffixIcon!.call();
        }
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: _decoration,
      obscureText: _obscureText,
      maxLength: widget.maxLength,
      focusNode: _focusNode,
      onTapOutside: (_) {
        if (_focusNode.hasFocus) {
          _focusNode.unfocus();
        }
      },
    );
  }
}
