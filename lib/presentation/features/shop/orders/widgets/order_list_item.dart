import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../comman/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      padding: EdgeInsets.all(AppSizes.md),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Iconsax.ship),
              SizedBox(
                width: AppSizes.spaceBtwItems / 2,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Processing",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: AppColors.primary, fontWeightDelta: 1),
                    ),
                    Text("07 Nov 2024",
                        style: Theme.of(context).textTheme.headlineSmall)
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Iconsax.arrow_right_34,
                    size: AppSizes.iconSm,
                  ))
            ],
          ),
          SizedBox(height: AppSizes.spaceBtwItems),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(Iconsax.tag),
                    SizedBox(
                      width: AppSizes.spaceBtwItems / 2,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Order",
                              style: Theme.of(context).textTheme.labelMedium),
                          Text(
                            "#23f3s",
                            style: Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 1,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(Iconsax.calendar),
                    SizedBox(
                      width: AppSizes.spaceBtwItems / 2,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Shipping Date",
                              style: Theme.of(context).textTheme.labelMedium),
                          Text(
                            "02 Dec 2024",
                            style: Theme.of(context).textTheme.titleMedium,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
