import 'package:flutter/material.dart';
import 'package:tapp/presentation/features/shop/product_detail/widgest/rating_and_share.dart';

import '../../../../../comman/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../../comman/widgets/images/circullar_image.dart';
import '../../../../../comman/widgets/texts/brand_title_text_with_verified_icon.dart';
import '../../../../../comman/widgets/texts/product_price.dart';
import '../../../../../comman/widgets/texts/product_title.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/enums.dart';
import '../../../../../core/utils/constants/images.dart';
import '../../../../../core/utils/constants/sizes.dart';

class TProductMetadata extends StatelessWidget {
  const TProductMetadata({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Rating & Stars
        TRatingAndShare(),

        /// - Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            TRoundedContainer(
              radius: AppSizes.sm,
              backGroundColor: AppColors.secondary.withOpacity(0.8),
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.sm, vertical: AppSizes.xs),
              child: Text(
                "25%",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.apply(color: AppColors.black),
              ),
            ),
            SizedBox(width: AppSizes.spaceBtwItems),
            Text(
              "\$250",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.apply(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(width: AppSizes.spaceBtwItems),
            TProductPriceText(
              price: "175",
              isLarge: true,
            ),
          ],
        ),

        const SizedBox(
          height: AppSizes.spaceBtwItems / 1.5,
        ),

        /// Title
        TProductTitle(title: "Green Nike Sports Shirt"),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 1.5,
        ),

        /// Stak
        Row(
          children: [
            TProductTitle(title: "Status"),
            SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            Text("In Stack", style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 1.5,
        ),

        /// Brand
        Row(
          children: [
            TCircularImage(
              image: TImages.cosmeticsIcon,
              height: 32,
              width: 32,
            ),
            TBrandTitleTextWithVerifiedIcon(
              title: "Nike",
              brandTextSize: TextSizes.medium,
            ),
          ],
        )

        /// Variations And review
      ],
    );
  }
}
