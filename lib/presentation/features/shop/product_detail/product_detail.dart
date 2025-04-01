import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:tapp/comman/widgets/texts/heading.dart';
import 'package:tapp/presentation/features/shop/product_detail/widgest/bottom_add_to_cart.dart';
import 'package:tapp/presentation/features/shop/product_detail/widgest/product_attributes.dart';
import 'package:tapp/presentation/features/shop/product_detail/widgest/product_image_slider.dart';
import 'package:tapp/presentation/features/shop/product_detail/widgest/product_meta_data.dart';

import 'package:tapp/core/utils/constants/app_routes.dart';
import 'package:tapp/core/utils/constants/sizes.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product image Slider
            TProductImageSlider(),
            Padding(
              padding: EdgeInsets.only(
                  bottom: AppSizes.defaultSpace,
                  left: AppSizes.defaultSpace,
                  right: AppSizes.defaultSpace),
              child: Column(
                children: [
                  ///  Product Details
                  TProductMetadata(),

                  /// Product Attributes
                  TProductAttributes(),
                  SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),

                  /// Checkout Button

                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Checkout"))),
                  SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),

                  /// --- Description
                  TSectionHeading(
                    title: "Description",
                    showActionButton: false,
                  ),

                  SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),

                  ReadMoreText(
                    "Can you specify the type of product? Are you looking for a description for an electronic device, clothing, software, or something else? Let me know the details so I can craft a compelling description",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimExpandedText: " Less",
                    trimCollapsedText: " Show More",
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  Divider(),
                  SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(
                        title: "Reviews(199)",
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.PRODUCT_REVIEWS);
                          },
                          icon: Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
