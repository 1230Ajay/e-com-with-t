import 'package:flutter/material.dart';

import '../../../../core/utils/constants/colors.dart';

class TCircullarContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry padding;
  final Widget? child;
  final Color backGroundColor;
  final EdgeInsetsGeometry margin;
  const TCircullarContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 200,
    this.padding = EdgeInsets.zero,
    this.child,
    this.backGroundColor = AppColors.white,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: backGroundColor),
      child: child ?? Container(),
    );
  }
}
