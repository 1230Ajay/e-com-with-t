import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/enums.dart';
import '../../../core/utils/constants/sizes.dart';
import 'TBrandTitleText.dart';

class TBrandTitleTextWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleTextWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = AppColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TBrandTitleText(
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            title: title,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: AppSizes.xs),
        Icon(Iconsax.verify5, size: AppSizes.iconXs, color: iconColor)
      ],
    );
  }
}
