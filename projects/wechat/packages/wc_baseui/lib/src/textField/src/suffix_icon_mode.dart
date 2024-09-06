part of 'custom_text_field.dart';

/// `TextField`的`suffixIcon`显示规则
enum TextFieldSuffixIconMode {
  /// 永远不显示
  never,

  /// 只有编辑的时候才显示
  whileEditing,

  /// 不编辑的时候才显示
  unlessEditing,

  /// 有文字内容的时候才显示
  whileContent,

  /// 一直显示
  always,
}

/// `TextField`的`suffixIcon`点击事件
enum TextFieldSuffixIconAction {
  /// 清除内容
  clear,

  /// 当前加密实现内容与否
  oppositeObscure,

  /// 其它自定义
  custom,
}
