import 'package:flutter/material.dart';
import 'package:tapp/comman/widgets/appbar/appbar.dart';
import 'package:tapp/core/utils/constants/app_routes.dart';
import 'package:tapp/core/utils/constants/sizes.dart';


import 'cart_items.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: TCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            bottom: AppSizes.md,
            right: AppSizes.defaultSpace,
            left: AppSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.CHECK_OUT);
            },
            child: Text("Checkout \$26453")),
      ),
    );
  }
}
