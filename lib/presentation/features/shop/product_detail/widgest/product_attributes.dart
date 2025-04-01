import 'package:flutter/material.dart';
import 'package:tapp/comman/widgets/custom_shapes/container/rounded_container.dart';
import 'package:tapp/comman/widgets/texts/heading.dart';
import 'package:tapp/comman/widgets/texts/product_price.dart';
import 'package:tapp/comman/widgets/texts/product_title.dart';
import 'package:tapp/core/utils/constants/colors.dart';
import 'package:tapp/core/utils/constants/sizes.dart';
import 'package:tapp/core/utils/helpers/helper_functions.dart';

import '../../../../../comman/widgets/chips/choice_chip.dart';


class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    var dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
          padding: EdgeInsets.all(AppSizes.md),
          backGroundColor: dark ? AppColors.darkerGrey : AppColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  TSectionHeading(title: "Variation", showActionButton: false),
                  SizedBox(width: AppSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const TProductTitle(
                            title: "Price",
                            smallSize: true,
                          ),
                          SizedBox(width: AppSizes.spaceBtwItems),
                          Text(
                            "\$25",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width: AppSizes.spaceBtwItems),
                          TProductPriceText(
                            price: "20",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TProductTitle(
                            title: "Stock",
                            smallSize: true,
                          ),
                          SizedBox(width: AppSizes.spaceBtwItems),
                          Text(
                            "in Stack",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const TProductTitle(
                title:
                    "This is the Description of the product and it can go up to like 4 max lines",
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),

        SizedBox(
          height: AppSizes.spaceBtwItems,
        ),

        /// --- Atributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(
              title: "Colors",
              showActionButton: false,
            ),
            SizedBox(
              height: AppSizes.spaceBtwItems / 2,
            ),
            Wrap(
              children: [
                TChoiceChip(
                  text: 'Green',
                  onSelected: (value) {},
                  selected: true,
                ),
                TChoiceChip(
                  text: 'Blue',
                  onSelected: (value) {},
                  selected: false,
                ),
                TChoiceChip(
                  text: 'Yellow',
                  onSelected: (value) {},
                  selected: false,
                ),
              ],
            )
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(
              title: "Size",
              showActionButton: false,
            ),
            SizedBox(
              height: AppSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: 'XL',
                  onSelected: (value) {},
                  selected: true,
                ),
                TChoiceChip(
                  text: 'XXL',
                  onSelected: (value) {},
                  selected: false,
                ),
                TChoiceChip(
                  text: 'M',
                  onSelected: (value) {},
                  selected: false,
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
