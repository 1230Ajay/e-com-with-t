import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/utils/constants/sizes.dart';

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Rating
        Row(
          children: [
            Icon(
              Iconsax.star5,
              size: 24,
              color: Colors.amber,
            ),
            SizedBox(width: AppSizes.spaceBtwItems / 2),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "5.0 ", style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(text: "(199)")
            ])),
          ],
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.share))
      ],
    );
  }
}
