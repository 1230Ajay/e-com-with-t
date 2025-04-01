import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tapp/core/utils/constants/sizes.dart';

import '../../../layout/grid_layout.dart';
import '../cards/product_card_vertical.dart';

class TShortTableWidget extends StatelessWidget {
  const TShortTableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            items: ["Name", "Higher Price", "Sale", "Newest", "Popularity"]
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (vale) {}),
        SizedBox(
          height: AppSizes.spaceBtwSections,
        ),
        GridLayout(
            itemCount: 6,
            itemBuilder: (_, index) {
              return TProductCardVertical();
            })
      ],
    );
  }
}
