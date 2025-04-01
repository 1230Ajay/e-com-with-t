import 'package:flutter/material.dart';
import 'package:tapp/comman/widgets/appbar/appbar.dart';
import 'package:tapp/presentation/features/shop/product_reviews/widgets/overall_product_rating.dart';
import 'package:tapp/presentation/features/shop/product_reviews/widgets/user_review_card.dart';

import 'package:tapp/core/utils/constants/sizes.dart';

import '../../../../comman/widgets/products/rating/rating_indicator.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Revies & Ratings"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Rating and revies are verified and are from people use the same type of device that you are."),
              SizedBox(height: AppSizes.spaceBtwItems),

              /// Overall Product Ratings
              OverallProductRating(),

              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              Row(
                children: [
                  TRatingBarIndicator(
                    rating: 4.7,
                  ),
                  const SizedBox(
                    width: AppSizes.spaceBtwItems / 2,
                  ),
                  Text(
                    "12,234",
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              /// User Review Design
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard()
            ],
          ),
        ),
      ),
    );
  }
}
