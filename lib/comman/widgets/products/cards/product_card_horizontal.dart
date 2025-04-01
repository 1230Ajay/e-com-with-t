import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/app_routes.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/images.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../../../icons/circular_icon.dart';
import '../../custom_shapes/container/rounded_container.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';
import '../../texts/product_price.dart';
import '../../texts/product_title.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoutes.PRODUCT_DETAIL),
      child: Container(
        width: 321,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
            color: dark ? AppColors.darkerGrey : AppColors.white,
            borderRadius: BorderRadius.circular(AppSizes.productImageRadius)),
        child: Row(
          children: [
            /// Thumbnail , Wishlist Button , Discount Tag
            TRoundedContainer(
              height: 120,
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitle(
                          title: "Grean Nike Air Shoes with half green",
                          smallSize: true,
                        ),
                        SizedBox(height: AppSizes.spaceBtwItems / 2),
                        TBrandTitleTextWithVerifiedIcon(
                          title: "Nike",
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: TProductPriceText(
                            price: "2500-6000",
                            maxLines: 1,
                          )),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.dark,
                                borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(AppSizes.cardRadiusMd),
                                    bottomRight: Radius.circular(
                                        AppSizes.cardRadiusMd))),
                            child: SizedBox(
                                width: AppSizes.iconLg * 1.2,
                                height: AppSizes.iconLg * 1.2,
                                child: Center(
                                    child: const Icon(Iconsax.add,
                                        color: AppColors.white))),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
