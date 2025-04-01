import 'package:flutter/material.dart';
import 'package:tapp/core/utils/constants/sizes.dart';

import '../../../../core/utils/constants/colors.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = AppSizes.cardRadiusMd,
      this.padding = EdgeInsets.zero,
      this.child,
      this.backGroundColor = AppColors.white,
      this.margin = EdgeInsets.zero,
      this.borderColor = AppColors.borderPrimary,
      this.showBorder = false});

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry padding;
  final Widget? child;
  final Color backGroundColor;
  final Color borderColor;
  final EdgeInsetsGeometry margin;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: showBorder ? Border.all(color: AppColors.grey) : null),
      child: child,
    );
  }
}
