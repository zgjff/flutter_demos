part of 'prefix_text_field.dart';

/// 包含prefix组件的`TextField`的prefix组件的宽度规则
@immutable
abstract class PrefixTextFieldMode {
  const PrefixTextFieldMode();

  /// 固定宽度
  double get fixedWidth;

  /// prefix比例
  int get preFlex;

  /// textField比例
  int get textFieldFlex;
}

/// 自动宽度---widget的宽度
class PrefixTextFieldAutoMode extends PrefixTextFieldMode {
  const PrefixTextFieldAutoMode();
  @override
  double get fixedWidth => 0;

  @override
  int get preFlex => 0;
  @override
  int get textFieldFlex => 0;
}

/// 固定宽度
class PrefixTextFieldFixedMode extends PrefixTextFieldMode {
  const PrefixTextFieldFixedMode(double fixedWidth) : _fixedWidth = fixedWidth;
  final double _fixedWidth;
  @override
  double get fixedWidth => _fixedWidth;
  @override
  int get preFlex => 0;
  @override
  int get textFieldFlex => 0;
}

/// 按比例
class PrefixTextFieldScaleMode extends PrefixTextFieldMode {
  const PrefixTextFieldScaleMode(int preFlex, int textFieldFlex)
      : _preFlex = preFlex,
        _textFieldFlex = textFieldFlex;

  final int _preFlex;
  final int _textFieldFlex;
  @override
  double get fixedWidth => 0;

  @override
  int get preFlex => _preFlex;
  @override
  int get textFieldFlex => _textFieldFlex;
}
