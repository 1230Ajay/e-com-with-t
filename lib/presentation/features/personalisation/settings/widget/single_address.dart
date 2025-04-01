import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tapp/core/utils/constants/colors.dart';
import 'package:tapp/core/utils/constants/sizes.dart';
import 'package:tapp/core/utils/helpers/helper_functions.dart';

import '../../../../../comman/widgets/custom_shapes/container/rounded_container.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({
    super.key,
    this.selectedAddress = true,
  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TRoundedContainer(
      padding: EdgeInsets.all(AppSizes.md),
      width: double.infinity,
      showBorder: true,
      backGroundColor: selectedAddress
          ? AppColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? AppColors.darkerGrey
              : AppColors.grey,
      margin: EdgeInsets.only(bottom: AppSizes.md),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? AppColors.light
                      : AppColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "John Doe",
                maxLines: 1,
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: AppSizes.sm / 2,
              ),
              Text(
                "(+123) 456 7890",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: AppSizes.sm / 2,
              ),
              Text(
                "82356 Timmy Coves, SouthLiana, Main , 82342, IN",
                softWrap: true,
              )
            ],
          )
        ],
      ),
    );
  }
}
