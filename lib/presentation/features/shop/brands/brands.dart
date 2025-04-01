import 'package:flutter/material.dart';
import 'package:tapp/comman/layout/grid_layout.dart';
import 'package:tapp/comman/widgets/appbar/appbar.dart';
import 'package:tapp/comman/widgets/brands/card/brand_card.dart';
import 'package:tapp/comman/widgets/texts/heading.dart';
import 'package:tapp/core/utils/constants/app_routes.dart';
import 'package:tapp/core/utils/constants/images.dart';
import 'package:tapp/core/utils/constants/sizes.dart';

class Brands extends StatelessWidget {
  const Brands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Brands"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              TSectionHeading(
                title: "Brands",
                showActionButton: false,
              ),
              SizedBox(height: AppSizes.spaceBtwItems),
              GridLayout(
                  mainAxisExtent: 80,
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return TBrandCard(
                      onTap: () => Navigator.of(context)
                          .pushNamed(AppRoutes.BRAND_PRODUCTS),
                      title: 'Nike',
                      subtTitle: '25 products',
                      image: TImages.shoeIcon,
                      showBorder: true,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
