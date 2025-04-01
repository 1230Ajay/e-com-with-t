import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../comman/icons/circular_icon.dart';
import '../../../../../comman/widgets/appbar/appbar.dart';
import '../../../../../comman/widgets/custom_shapes/curved_edges/top_curved_edges.dart';
import '../../../../../comman/widgets/images/rounded_image.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/images.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';


class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TopCurvedEdgesWidget(
      child: Container(
        color: THelperFunctions.isDarkMode(context)
            ? AppColors.darkGrey
            : AppColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.productImageRadius * 2),
                child: Image(image: AssetImage(TImages.productImage1)),
              ),
            ),

            /// Image Slider

            Positioned(
              right: 0,
              bottom: 30,
              left: AppSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => TRoundedImage(
                        width: 80,
                        backgroundColor: THelperFunctions.isDarkMode(context)
                            ? AppColors.dark
                            : AppColors.white,
                        border: Border.all(color: AppColors.primary),
                        padding: EdgeInsets.all(AppSizes.md),
                        imageUrl: TImages.productImage3),
                    separatorBuilder: (_, __) => SizedBox(
                          width: AppSizes.spaceBtwItems,
                        ),
                    itemCount: 4),
              ),
            ),

            /// AppBar Icon

            TAppBar(
              action: [TCircularIcon(icon: Iconsax.heart, onPress: () {})],
            )
          ],
        ),
      ),
    );
  }
}
