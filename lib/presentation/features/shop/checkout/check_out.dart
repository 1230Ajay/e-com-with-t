import 'package:flutter/material.dart';
import 'package:tapp/comman/widgets/appbar/appbar.dart';
import 'package:tapp/comman/widgets/custom_shapes/container/rounded_container.dart';
import 'package:tapp/comman/widgets/success_screen/success_screen.dart';
import 'package:tapp/presentation/features/shop/checkout/widgets/billing_address_section.dart';
import 'package:tapp/presentation/features/shop/checkout/widgets/billing_amount_section.dart';
import 'package:tapp/presentation/features/shop/checkout/widgets/billing_payment_section.dart';

import 'package:tapp/core/utils/constants/app_routes.dart';
import 'package:tapp/core/utils/constants/colors.dart';
import 'package:tapp/core/utils/constants/images.dart';
import 'package:tapp/core/utils/constants/sizes.dart';
import 'package:tapp/core/utils/helpers/helper_functions.dart';

import '../../../../comman/widgets/products/cart/coupon.dart';
import '../cart/cart_items.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Order Revies",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// --- Items in Cart
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              /// --- Coupan Textfields
              TCouponCode(),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// --- BIlling Section

              TRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(AppSizes.md),
                backGroundColor: dark ? AppColors.black : AppColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    BillingAmountSection(),
                    SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),

                    /// Divider
                    Divider(),
                    SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),

                    /// Billing Payment Section
                    BillingPaymentSection(),

                    /// Billing Address
                    BillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            bottom: AppSizes.md,
            right: AppSizes.defaultSpace,
            left: AppSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SuccessScreen(
                    image: TImages.successfulPaymentIcon,
                    title: "Payment Successful",
                    subtitle: "Your item will be delivered",
                    onPress: () {
                      Navigator.of(context).pushNamed(AppRoutes.HOME_MENU);
                    },
                  ),
                ),
              );
            },
            child: Text("Checkout \$26453")),
      ),
    );
  }
}
