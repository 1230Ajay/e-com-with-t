import 'package:flutter/material.dart';

import '../../../../comman/widgets/products/cart/add_remove_button.dart';
import '../../../../comman/widgets/products/cart/cart_item.dart';
import '../../../../comman/widgets/texts/product_price.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return Column(
            children: [
              TCartItem(),
              SizedBox(height: AppSizes.spaceBtwItems),
              if (showAddRemoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 76,
                        ),
                        TProductQuantityWithAddAndRemoveButton(),
                      ],
                    ),
                    TProductPriceText(price: "3242")
                  ],
                )
            ],
          );
        },
        separatorBuilder: (_, __) => Padding(
            padding: EdgeInsets.only(bottom: AppSizes.sm, top: AppSizes.sm),
            child: Divider(
              color: AppColors.grey.withOpacity(0.5),
            )),
        itemCount: 2);
  }
}
