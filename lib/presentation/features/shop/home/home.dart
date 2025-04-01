import 'package:flutter/material.dart';
import 'package:tapp/comman/widgets/products/cards/product_card_vertical.dart';
import 'package:tapp/presentation/features/shop/home/widgets/appbar.dart';
import 'package:tapp/presentation/features/shop/home/widgets/categories.dart';

import 'package:tapp/core/utils/constants/app_routes.dart';
import 'package:tapp/core/utils/constants/colors.dart';

import 'package:tapp/core/utils/constants/sizes.dart';
import 'package:tapp/core/utils/helpers/helper_functions.dart';
import '../../../../comman/layout/grid_layout.dart';
import '../../../../comman/widgets/custom_shapes/container/primary_header_container.dart';
import '../../../../comman/widgets/custom_shapes/container/search_container.dart';

import '../../../../comman/widgets/slider/slider.dart';
import '../../../../comman/widgets/texts/heading.dart';
import '../../../../core/utils/constants/images.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          /// Header Container --> With welcome text and cart icon button
          TPrimaryHeaderContainer(
            child: Column(
              children: [
                const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),

                /// Appbar -->
                THomeAppbar(),
                const SizedBox(height: AppSizes.spaceBtwSections),

                /// Search bar -->
                TSearchBar(text: "Search in store"),
                const SizedBox(height: AppSizes.spaceBtwSections),

                /// Categories -->
                Padding(
                  padding: EdgeInsets.only(left: AppSizes.defaultSpace),
                  child: Column(
                    children: [
                      TSectionHeading(
                        title: "Popular category",
                        showActionButton: false,
                        textColor: AppColors.grey,
                      ),
                      SizedBox(height: AppSizes.spaceBtwItems),
                      HomeCategories()
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSizes.spaceBtwSections,
                )
              ],
            ),
          ),

          /// ---> BODY STARTS FROM HERE
          Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                TSlider(
                  banners: [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3,
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3,
                  ],
                ),
                SizedBox(height: AppSizes.spaceBtwSections),
                TSectionHeading(
                  title: "Popular Products",
                  onPress: () {
                    Navigator.of(context).pushNamed(AppRoutes.ALL_PRODUCTS);
                  },
                ),
                GridLayout(
                    itemCount: 10,
                    itemBuilder: (_, index) => TProductCardVertical()),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
