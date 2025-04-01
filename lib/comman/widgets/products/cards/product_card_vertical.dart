import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tapp/comman/widgets/custom_shapes/container/rounded_container.dart';
import 'package:tapp/comman/widgets/images/rounded_image.dart';
import 'package:tapp/comman/widgets/texts/product_price.dart';
import 'package:tapp/comman/widgets/texts/product_title.dart';
import 'package:tapp/core/utils/constants/app_routes.dart';
import 'package:tapp/core/utils/constants/colors.dart';
import 'package:tapp/core/utils/constants/images.dart';
import 'package:tapp/core/utils/constants/sizes.dart';
import 'package:tapp/core/utils/helpers/helper_functions.dart';

import '../../../icons/circular_icon.dart';
import '../../styles/shadows.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoutes.PRODUCT_DETAIL),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            color: dark ? AppColors.darkerGrey : AppColors.white,
            borderRadius: BorderRadius.circular(AppSizes.productImageRadius)),
        child: Column(
          children: [
            /// Thumbnail , Wishlist Button , Discount Tag
            TRoundedContainer(
              padding: EdgeInsets.all(AppSizes.sm),
              radius: AppSizes.cardRadiusMd,
              backGroundColor: dark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  TRoundedImage(
                    imageUrl: TImages.productImage1,
                    applyImageRadius: true,
                    onPressed: () {},
                  ),

                  /// --> Sale Tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: AppSizes.xs,
                      backGroundColor: AppColors.secondary.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.sm, vertical: AppSizes.xs),
                      child: Text(
                        "25%",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),

                  Positioned(
                      top: 0,
                      right: 0,
                      child: TCircularIcon(
                          icon: Iconsax.heart5,
                          onPress: () {},
                          color: Colors.red,
                          backgroundColor: Colors.transparent))
                ],
              ),
            ),

            const SizedBox(
              height: AppSizes.spaceBtwItems / 2,
            ),

            /// ---> Details

            Padding(
              padding: EdgeInsets.only(left: AppSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitle(
                    title: "Grean Nike Air Shoes",
                    smallSize: true,
                  ),
                  SizedBox(height: AppSizes.spaceBtwItems / 2),
                  TBrandTitleTextWithVerifiedIcon(
                    title: "Nike",
                  ),
                ],
              ),
            ),

            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: AppSizes.md),
                  child: TProductPriceText(price: "25"),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.dark,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSizes.cardRadiusMd),
                          bottomRight: Radius.circular(AppSizes.cardRadiusMd))),
                  child: SizedBox(
                      width: AppSizes.iconLg * 1.2,
                      height: AppSizes.iconLg * 1.2,
                      child: Center(
                          child:
                              const Icon(Iconsax.add, color: AppColors.white))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
