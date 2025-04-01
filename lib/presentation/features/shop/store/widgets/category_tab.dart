import 'package:flutter/material.dart';
import 'package:tapp/comman/layout/grid_layout.dart';
import 'package:tapp/comman/widgets/products/cards/product_card_vertical.dart';
import 'package:tapp/comman/widgets/texts/heading.dart';
import 'package:tapp/core/utils/constants/images.dart';
import 'package:tapp/core/utils/constants/sizes.dart';

import 'brand_show_case.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              TBrandShowCase(images: [
                TImages.productImage1,
                TImages.productImage2,
              ]),
              TSectionHeading(title: "You might like"),
              SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              GridLayout(
                  itemCount: 2,
                  itemBuilder: (_, index) => TProductCardVertical())
            ],
          ),
        ),
      ],
    );
  }
}
