import 'package:flutter/material.dart';
import 'package:tapp/comman/widgets/appbar/appbar.dart';
import 'package:tapp/comman/widgets/images/rounded_image.dart';
import 'package:tapp/comman/widgets/products/cards/product_card_horizontal.dart';
import 'package:tapp/comman/widgets/texts/heading.dart';
import 'package:tapp/core/utils/constants/images.dart';
import 'package:tapp/core/utils/constants/sizes.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Sports"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              TRoundedImage(
                width: double.infinity,
                imageUrl: TImages.promoBanner3,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              /// Sub Categories

              Column(
                children: [
                  TSectionHeading(
                    title: "Sports Shirts",
                    onPress: () {},
                  ),
                  SizedBox(
                    height: AppSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (_, index) => TProductCardHorizontal(),
                        separatorBuilder: (_, __) => SizedBox(
                              width: AppSizes.md,
                            ),
                        itemCount: 4),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
