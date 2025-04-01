import 'package:flutter/material.dart';
import 'package:tapp/core/utils/constants/sizes.dart';

import '../../../../../comman/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../../comman/widgets/texts/heading.dart';
import '../../../../../core/utils/constants/images.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionHeading(
          title: "Payment Method",
          onPress: () {},
          buttonTitle: "Change",
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 60,
              padding: EdgeInsets.all(AppSizes.sm),
              child: Image(image: AssetImage(TImages.paypal)),
            ),
            SizedBox(
              width: AppSizes.spaceBtwItems / 2,
            ),
            Text("Paypal", style: Theme.of(context).textTheme.bodyLarge)
          ],
        )
      ],
    );
  }
}
