import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GlobalPointerListener extends StatefulWidget {
  const GlobalPointerListener({
    super.key,
    required this.child,
    this.onPanDown,
    this.onPanUp,
    this.safePadding,
  });

  final Widget child;
  final EdgeInsets? safePadding;
  final Function(PointerEvent event, bool inside)? onPanDown;
  final Function(PointerEvent event, bool inside)? onPanUp;

  @override
  State<GlobalPointerListener> createState() => _GlobalPointerListenerState();
}

class _GlobalPointerListenerState extends State<GlobalPointerListener> {
  @override
  void initState() {
    super.initState();
    GestureBinding.instance.pointerRouter.addGlobalRoute(_handlePointerEvent);
  }

  @override
  void dispose() {
    GestureBinding.instance.pointerRouter
        .removeGlobalRoute(_handlePointerEvent);
    super.dispose();
  }

  void _handlePointerEvent(PointerEvent event) {
    final renderObject = context.findRenderObject();
    if (renderObject == null) {
      return;
    }
    final isRenderBox = renderObject is RenderBox;
    if (!isRenderBox) {
      return;
    }
    final box = renderObject;
    final target = box.localToGlobal(Offset.zero) & box.size;
    final safePadding = widget.safePadding ?? EdgeInsets.zero;
    final safeTarget = safePadding.inflateRect(target);
    final inside = safeTarget.contains(event.position);
    if (event is PointerUpEvent || event is PointerCancelEvent) {
      widget.onPanUp?.call(event, inside);
    } else if (event is PointerDownEvent) {
      widget.onPanDown?.call(event, inside);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
