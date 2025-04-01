import 'package:flutter/material.dart';
import 'package:tapp/comman/widgets/appbar/appbar.dart';
import 'package:tapp/comman/widgets/brands/card/brand_card.dart';
import 'package:tapp/comman/widgets/products/shortable/shortable_widget.dart';
import 'package:tapp/core/utils/constants/images.dart';
import 'package:tapp/core/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Nike"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(
                title: "Nike",
                subtTitle: "25 products",
                image: TImages.clothIcon,
                showBorder: true,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              TShortTableWidget()
            ],
          ),
        ),
      ),
    );
  }
}
