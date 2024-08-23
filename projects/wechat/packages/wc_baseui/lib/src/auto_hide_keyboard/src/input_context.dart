import 'package:flutter/widgets.dart';

class InputContext {
  InputContext({required this.context, required this.safePadding});
  final BuildContext context;
  final EdgeInsets? safePadding;
}
