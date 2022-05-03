import 'package:flutter/material.dart';
import 'package:fruity/ui/home/widgets/custom_header/custom_header.dart';
import 'package:fruity/ui/home/widgets/custom_header/widget/gradient_background_widget.dart';
import 'package:fruity/ui/home/widgets/custom_header/widget/header_item_widget.dart';
import 'package:fruity/ui/home/widgets/custom_header/widget/mutable_background_widget.dart';

extension XWidget on Widget {
  Widget transform(double progress) {
    if (this is FlexibleHeaderItem) {
      return HeaderItemWidget(this as FlexibleHeaderItem?, progress);
    } else if (this is MutableBackground) {
      return MutableBackgroundWidget(progress, this as MutableBackground?);
    } else if (this is GradientBackground) {
      return GradientBackgroundWidget(progress, this as GradientBackground?);
    }

    return this;
  }
}
