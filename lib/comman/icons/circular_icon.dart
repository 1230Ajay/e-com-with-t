import 'package:flutter/material.dart';

import '../../core/utils/constants/colors.dart';
import '../../core/utils/constants/sizes.dart';
import '../../core/utils/helpers/helper_functions.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    required this.icon,
    this.size = AppSizes.lg,
    this.width,
    this.height,
    this.color,
    this.backgroundColor,
    required this.onPress,
  });

  final IconData icon;
  final double? size, width, height;
  final Color? color;
  final Color? backgroundColor;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? AppColors.black.withOpacity(0.9)
                : AppColors.white.withOpacity(0.9)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
          onPressed: onPress,
          icon: Icon(
            icon,
            size: size,
            color: color,
          )),
    );
  }
}
