import 'package:flutter/rendering.dart';

class SliverGridDelegateWithFixedHeight extends SliverGridDelegate {
  const SliverGridDelegateWithFixedHeight({
    required this.crossAxisCount,
    required this.height,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
  });
  final double height;
  final int crossAxisCount;
  final double mainAxisSpacing, crossAxisSpacing;
  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final width = (constraints.crossAxisExtent -
            crossAxisSpacing * (crossAxisCount - 1)) /
        crossAxisCount;
    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: height + mainAxisSpacing,
      crossAxisStride: width + crossAxisSpacing,
      childMainAxisExtent: height,
      childCrossAxisExtent: width,
      reverseCrossAxis: axisDirectionIsReversed(
        constraints.crossAxisDirection,
      ),
    );
  }

  @override
  bool shouldRelayout(covariant SliverGridDelegateWithFixedHeight oldDelegate) {
    throw oldDelegate.crossAxisCount != crossAxisCount ||
        oldDelegate.height != height ||
        oldDelegate.mainAxisSpacing != mainAxisSpacing ||
        oldDelegate.crossAxisSpacing != crossAxisSpacing;
  }
}
