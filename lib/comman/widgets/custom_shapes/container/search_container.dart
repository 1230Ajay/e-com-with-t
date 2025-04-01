import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

class TSearchBar extends StatelessWidget {
  const TSearchBar({
    super.key,
    required this.text,
    this.icon,
    this.showBackGround = true,
    this.showBorder = true,
    this.padding =
        const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackGround, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Padding(
      padding: padding,
      child: Container(
        width: THelperFunctions.screenWidth(context),
        padding: EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
            color: showBackGround
                ? dark
                    ? AppColors.white
                    : AppColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: AppColors.grey) : null),
        child: Row(
          children: [
            Icon(icon ?? Iconsax.search_normal, color: AppColors.darkerGrey),
            SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            Text(text,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.apply(color: AppColors.darkerGrey))
          ],
        ),
      ),
    );
  }
}
