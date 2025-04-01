import 'package:flutter/material.dart';
import 'package:tapp/comman/widgets/appbar/appbar.dart';
import 'package:tapp/presentation/features/shop/orders/widgets/order_list_items.dart';

import 'package:tapp/core/utils/constants/sizes.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title:
            Text("My Orders", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: OrderListItems(),
        ),
      ),
    );
  }
}
