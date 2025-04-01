import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../../../icons/circular_icon.dart';

class TProductQuantityWithAddAndRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddAndRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Add And Remove Buttons

        TCircularIcon(
          size: AppSizes.md,
          height: 32,
          width: 32,
          icon: Iconsax.minus,
          onPress: () {},
          color: THelperFunctions.isDarkMode(context)
              ? AppColors.white
              : AppColors.black,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? AppColors.darkerGrey
              : AppColors.light,
        ),
        const SizedBox(
          width: AppSizes.spaceBtwItems,
        ),
        Text(
          "2",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: AppSizes.spaceBtwItems,
        ),
        TCircularIcon(
          size: AppSizes.md,
          height: 32,
          width: 32,
          icon: Iconsax.add,
          onPress: () {},
          color: THelperFunctions.isDarkMode(context)
              ? AppColors.white
              : AppColors.white,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? AppColors.darkerGrey
              : AppColors.primary,
        ),
      ],
    );
  }
}
