library sliver_flutter;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fruity/ui/home/widgets/custom_header/extension/widget_extension.dart';
import 'package:fruity/ui/home/widgets/custom_header/item/header_background.dart';

typedef FlexibleBuilder = Widget Function(
  BuildContext context,
  double progress,
);

class FlexibleHeaderDelegate extends SliverPersistentHeaderDelegate {
  FlexibleHeaderDelegate({
    this.collapsedHeight = kToolbarHeight,
    this.expandedHeight = kToolbarHeight * 3,
    this.child,
    this.actions,
    this.title,
    this.backgroundColor,
    this.background,
    this.collapsedElevation = 8,
    this.expandedElevation = 0,
    this.leading,
    this.statusBarHeight = 0,
    this.builderAction,
    // this.leadingWidth = 56,
  });

  final List<Widget>? actions;
  final Widget? leading;
  final Widget? title;

  final double expandedHeight;
  final double collapsedHeight;
  final Widget? child;
  final Color? backgroundColor;
  final Widget? background;
  final double expandedElevation;
  final double collapsedElevation;
  // final double leadingWidth;
  final FlexibleBuilder? builderAction;
  final double statusBarHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final offset = min(shrinkOffset, maxExtent - minExtent);
    final progress = offset / (maxExtent - minExtent);
    final visibleMainHeight = max(maxExtent - shrinkOffset, minExtent);

    return Material(
      elevation: progress < 1 ? expandedElevation : collapsedElevation,
      color: Colors.transparent,
      child: Stack(
        children: [
          if (background != null) background!.transform(progress),
          Container(
              height: visibleMainHeight,
              padding: EdgeInsets.only(top: statusBarHeight),
              child: child!.transform(progress)),
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            actions: [
              if (builderAction != null) builderAction!(context, progress),
            ],
            leading: leading,
            title: title,
            elevation: 0,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + statusBarHeight;

  @override
  double get minExtent => collapsedHeight + statusBarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class MutableBackground extends HeaderBackground {
  const MutableBackground({
    this.expandedWidget,
    this.expandedColor,
    this.collapsedWidget,
    this.collapsedColor,
    this.animationDuration = const Duration(milliseconds: 150),
    Key? key,
  })  : assert(expandedColor == null || expandedWidget == null),
        assert(collapsedColor == null || collapsedWidget == null),
        super(key: key);

  final Widget? expandedWidget;
  final Widget? collapsedWidget;
  final Color? expandedColor;
  final Color? collapsedColor;
  final Duration animationDuration;
}

class GradientBackground extends HeaderBackground {
  const GradientBackground({
    required this.gradient,
    this.modifyGradient = true,
    Key? key,
  }) : super(key: key);

  final Gradient gradient;
  final bool modifyGradient;
}

enum HeaderItemOptions {
  scale,
  hide,
}

class FlexibleHeaderItem extends Widget {
  const FlexibleHeaderItem({
    this.child,
    this.alignment,
    this.expandedAlignment,
    this.collapsedAlignment,
    this.padding,
    this.expandedPadding,
    this.collapsedPadding,
    this.margin,
    this.expandedMargin,
    this.collapsedMargin,
    this.options = const [],
    Key? key,
  })  : assert(alignment == null ||
            (expandedAlignment == null && collapsedAlignment == null)),
        assert(padding == null ||
            (expandedPadding == null && collapsedPadding == null)),
        assert(margin == null ||
            (expandedMargin == null && collapsedMargin == null)),
        super(key: key);

  final Alignment? alignment;
  final Alignment? expandedAlignment;
  final Alignment? collapsedAlignment;

  final EdgeInsets? padding;
  final EdgeInsets? expandedPadding;
  final EdgeInsets? collapsedPadding;

  final EdgeInsets? margin;
  final EdgeInsets? expandedMargin;
  final EdgeInsets? collapsedMargin;

  final List<HeaderItemOptions> options;

  final Widget? child;

  @override
  Element createElement() =>
      throw Exception('Unable to wrap $this with other widgets');
}
