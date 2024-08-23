import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wc_baseui/src/auto_hide_keyboard/src/global_pointer_listener.dart';

import 'input_context.dart';

class AutoHideKeyboard extends StatefulWidget {
  const AutoHideKeyboard({
    super.key,
    required this.child,
    this.safePadding,
  });

  const AutoHideKeyboard.ignorePadding({
    super.key,
    required this.child,
    this.safePadding = EdgeInsets.zero,
  });

  final Widget child;
  final EdgeInsets? safePadding;
  static const EdgeInsets _defaultSafePadding = EdgeInsets.only(top: 48);
  static int _id = 0;
  static String _getId() => (_id++).toString();
  static final Set<String> _visibleInputs = {};
  static final Map<String, InputContext> _inputs = {};
  static void _addInput(String id, InputContext input) {
    _inputs[id] = input;
  }

  static void _removeInput(String id) {
    _inputs.remove(id);
  }

  static void _onVisibilityChanged(String id, bool visible) {
    if (visible) {
      _visibleInputs.add(id);
    } else {
      _visibleInputs.remove(id);
    }
  }

  static bool _shouldHideKeyboard(
    BuildContext context,
    String id,
    PointerEvent event,
  ) {
    bool isTapInside(InputContext input, PointerEvent event) {
      final safePadding =
          input.safePadding ?? AutoHideKeyboard._defaultSafePadding;
      final renderObject = input.context.findRenderObject();
      if (renderObject is RenderBox) {
        final box = renderObject;
        final target = renderObject.localToGlobal(Offset.zero) & box.size;
        final safeTarget = safePadding.inflateRect(target);
        return safeTarget.contains(event.position);
      }
      return false;
    }

    final inputs = _visibleInputs.map((id) => _inputs[id]!).toList();
    return !inputs.any((e) => isTapInside(e, event));
  }

  @override
  State<AutoHideKeyboard> createState() => _AutoHideKeyboardState();
}

class _AutoHideKeyboardState extends State<AutoHideKeyboard> {
  final Key _key = UniqueKey();
  final String _id = AutoHideKeyboard._getId();

  @override
  void initState() {
    super.initState();
    AutoHideKeyboard._addInput(
      _id,
      InputContext(context: context, safePadding: widget.safePadding),
    );
  }

  @override
  void dispose() {
    AutoHideKeyboard._removeInput(_id);
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo visibilityInfo) {
    var visible = visibilityInfo.visibleFraction > 0;
    AutoHideKeyboard._onVisibilityChanged(_id, visible);
  }

  @override
  Widget build(BuildContext context) {
    return GlobalPointerListener(
      onPanDown: (event, inside) {
        if (!inside &&
            AutoHideKeyboard._shouldHideKeyboard(context, _id, event)) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: VisibilityDetector(
        key: _key,
        onVisibilityChanged: _onVisibilityChanged,
        child: widget.child,
      ),
    );
  }
}
