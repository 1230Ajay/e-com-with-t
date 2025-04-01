import 'package:flutter/material.dart';
import 'package:tapp/comman/layout/grid_layout.dart';
import 'package:tapp/comman/widgets/appbar/appbar.dart';
import 'package:tapp/comman/widgets/custom_shapes/container/search_container.dart';
import 'package:tapp/comman/widgets/products/cart/cart_counter.dart';
import 'package:tapp/presentation/features/shop/store/widgets/category_tab.dart';
import 'package:tapp/core/utils/constants/app_routes.dart';
import 'package:tapp/core/utils/constants/colors.dart';
import 'package:tapp/core/utils/constants/images.dart';
import 'package:tapp/core/utils/constants/sizes.dart';
import 'package:tapp/core/utils/helpers/helper_functions.dart';

import '../../../../comman/widgets/appbar/tabbar.dart';
import '../../../../comman/widgets/brands/card/brand_card.dart';
import '../../../../comman/widgets/texts/heading.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title:
              Text("Store", style: Theme.of(context).textTheme.headlineMedium),
          action: [
            TCartCounterIcon(
              onPress: () {},
            )
          ],
          showBackArrow: false,
        ),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  backgroundColor: dark ? AppColors.black : AppColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: EdgeInsets.all(AppSizes.defaultSpace),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        /// ---> Search Bar
                        SizedBox(height: AppSizes.spaceBtwItems),
                        TSearchBar(
                          text: "Search",
                          showBackGround: false,
                          padding: EdgeInsets.zero,
                        ),
                        SizedBox(height: AppSizes.spaceBtwSections),

                        /// ---> Featured Brands
                        TSectionHeading(
                          title: "Featured Brands",
                          showActionButton: true,
                          onPress: () {
                            Navigator.of(context).pushNamed(AppRoutes.BRANDS);
                          },
                        ),
                        const SizedBox(
                          height: AppSizes.defaultSpace,
                        ),

                        GridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return TBrandCard(
                                onTap: () => Navigator.of(context)
                                    .pushNamed(AppRoutes.BRAND_PRODUCTS),
                                title: "Nike",
                                subtTitle: "256 Products",
                                image: TImages.clothIcon,
                                showBorder: true,
                              );
                            })
                      ],
                    ),
                  ),

                  /// ---> Tabs

                  bottom: TTabBar(
                    tabs: [
                      Tab(child: Text("Sports")),
                      Tab(child: Text("Furniture")),
                      Tab(child: Text("Electronics")),
                      Tab(child: Text("Clothes")),
                      Tab(child: Text("Entertainment"))
                    ],
                  ),
                )
              ];
            },
            body: TabBarView(children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ])),
      ),
    );
  }
}
