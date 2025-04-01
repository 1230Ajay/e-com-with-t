import 'package:flutter/material.dart';
import 'package:tapp/core/utils/constants/sizes.dart';

import 'order_list_item.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return OrderListItem();
        },
        separatorBuilder: (_, index) {
          return SizedBox(
            height: AppSizes.spaceBtwItems,
          );
        },
        itemCount: 4);
  }
}
