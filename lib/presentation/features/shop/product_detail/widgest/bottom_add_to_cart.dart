import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tapp/comman/icons/circular_icon.dart';
import 'package:tapp/core/utils/constants/colors.dart';
import 'package:tapp/core/utils/constants/sizes.dart';
import 'package:tapp/core/utils/helpers/helper_functions.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.defaultSpace,
          vertical: AppSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? AppColors.darkerGrey : AppColors.light,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSizes.cardRadiusLg),
              topRight: Radius.circular(AppSizes.cardRadiusLg))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TCircularIcon(
                  height: 40, width: 40, icon: Iconsax.minus, onPress: () {}),
              SizedBox(
                width: AppSizes.spaceBtwItems,
              ),
              Text("2"),
              SizedBox(
                width: AppSizes.spaceBtwItems,
              ),
              TCircularIcon(
                  height: 40, width: 40, icon: Iconsax.add, onPress: () {}),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(AppSizes.md),
                backgroundColor: AppColors.black,
                side: BorderSide(color: AppColors.black)),
            onPressed: () {},
            child: Text("Add to Cart"),
          )
        ],
      ),
    );
  }
}
