import 'package:flutter/material.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.border,
    this.applyImageRadius = false,
    this.backgroundColor = AppColors.light,
    this.borderRadius = AppSizes.md,
    this.fit = BoxFit.contain,
    this.padding,
    this.onPressed,
    this.isNetworkImage = false,
    this.margin,
  });

  final double? width, height;
  final String imageUrl;
  final BoxBorder? border;
  final bool applyImageRadius;
  final Color backgroundColor;
  final double borderRadius;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final void Function()? onPressed;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed!(),
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(AppSizes.md)
                : BorderRadius.zero,
            child: Image(
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider,
              fit: fit,
            )),
      ),
    );
  }
}
