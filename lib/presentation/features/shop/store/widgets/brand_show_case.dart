import 'package:flutter/material.dart';

import '../../../../../comman/widgets/brands/card/brand_card.dart';
import '../../../../../comman/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/images.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: EdgeInsets.all(AppSizes.md),
      showBorder: true,
      borderColor: AppColors.darkGrey,
      backGroundColor: Colors.transparent,
      margin: EdgeInsets.only(bottom: AppSizes.defaultSpace),
      child: Column(
        children: [
          TBrandCard(
              title: "Nike",
              subtTitle: "56 Products",
              image: TImages.clothIcon),
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, BuildContext context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backGroundColor: THelperFunctions.isDarkMode(context)
            ? AppColors.darkerGrey
            : AppColors.light,
        margin: const EdgeInsets.only(right: AppSizes.md),
        padding: EdgeInsets.all(AppSizes.md),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
