import 'package:flutter/material.dart';

import '../../../../core/utils/constants/images.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';
import '../../texts/product_title.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        TRoundedImage(
          padding: EdgeInsets.all(AppSizes.md),
          imageUrl: TImages.productImage1,
          height: 60,
          width: 60,
        ),
        const SizedBox(
          width: AppSizes.spaceBtwItems,
        ),

        /// Title , Price & Size
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TBrandTitleTextWithVerifiedIcon(title: "Nike"),
            Flexible(
              child: TProductTitle(title: "Black Spots shoes", maxLines: 1),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Color ",
                  style: Theme.of(context).textTheme.bodyMedium),
              TextSpan(
                  text: "Green ", style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(
                  text: "Size ", style: Theme.of(context).textTheme.bodyMedium),
              TextSpan(
                  text: "UK 08 ", style: Theme.of(context).textTheme.bodyLarge),
            ]))
          ],
        )
      ],
    );
  }
}
