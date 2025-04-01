import 'package:flutter/material.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/images.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helpers/helper_functions.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = AppColors.white,
    this.backgroundColor = AppColors.white,
    this.onTap, this.isNetworkImage=false,
  });

  final String image, title;
  final Color? textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => onTap!(),
      child: Padding(
        padding: const EdgeInsets.only(right: AppSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: EdgeInsets.all(AppSizes.md),
              decoration: BoxDecoration(
                  color: backgroundColor ??
                      (dark ? AppColors.dark : AppColors.white),
                  borderRadius: BorderRadius.circular(56)),
              child: Center(
                child: Image(
                  image:  AssetImage(image),
                  fit: BoxFit.cover,
                  color: dark ? AppColors.white : AppColors.black,
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),
            SizedBox(
                width: 56,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ))
          ],
        ),
      ),
    );
  }
}
