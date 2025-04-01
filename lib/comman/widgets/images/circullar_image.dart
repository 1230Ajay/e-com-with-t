import 'package:flutter/material.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.padding = const EdgeInsets.all(AppSizes.sm),
    this.height = 56,
    this.width = 56,
    required this.image,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    this.overlayColor,
    this.isNetworkImage = false,
  });

  final EdgeInsetsGeometry? padding;
  final double height, width;
  final BoxFit? fit;
  final String image;
  final Color? backgroundColor;
  final Color? overlayColor;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height,
      height: width,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? AppColors.black
                : AppColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image(
            image: isNetworkImage ? NetworkImage(image) : AssetImage(image),
            // color: overlayColor??( THelperFunctions.isDarkMode(context)
            //     ? AppColors.white
            //     : AppColors.black),
          ),
        ),
      ),
    );
  }
}
