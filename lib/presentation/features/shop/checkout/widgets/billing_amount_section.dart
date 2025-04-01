import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/sizes.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SubTotal
        Row(
          children: [
            Text(
              "Subtotal",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Spacer(),
            Text(
              "\$256.0",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),

        /// Shipping Fee
        Row(
          children: [
            Text(
              "Shipping Fee",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Spacer(),
            Text(
              "\$0.0",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),

        /// Tax Fee
        Row(
          children: [
            Text(
              "Tax Fee",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Spacer(),
            Text(
              "\$0.0",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),

        /// Order Total
        Row(
          children: [
            Text(
              "Order Total",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Spacer(),
            Text(
              "\$0.0",
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),
      ],
    );
  }
}
