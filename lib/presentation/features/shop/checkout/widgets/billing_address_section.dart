import 'package:flutter/material.dart';
import 'package:tapp/comman/widgets/texts/heading.dart';
import 'package:tapp/core/utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: "Address",
          onPress: () {},
          buttonTitle: "Change",
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),
        Text(
          "Coding with Dev",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            Icon(Icons.call),
            SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            Text(
              "(+91) 748 946 3450",
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            )
          ],
        ),
        SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            Icon(Icons.location_history),
            SizedBox(
              width: AppSizes.spaceBtwItems,
            ),
            Text(
              "South Lane, Maina 84535, IN",
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            )
          ],
        )
      ],
    );
  }
}
