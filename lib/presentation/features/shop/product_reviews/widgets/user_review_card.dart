import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:tapp/comman/widgets/custom_shapes/container/rounded_container.dart';
import 'package:tapp/comman/widgets/products/rating/rating_indicator.dart';
import 'package:tapp/core/utils/constants/colors.dart';
import 'package:tapp/core/utils/constants/images.dart';
import 'package:tapp/core/utils/constants/sizes.dart';
import 'package:tapp/core/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundImage: AssetImage(TImages.userProfileImage1),
            ),
            title:
                Text("Nirmala", style: Theme.of(context).textTheme.titleLarge),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ),
        ),

        /// Review
        SizedBox(height: AppSizes.spaceBtwItems),
        Row(
          children: [
            TRatingBarIndicator(rating: 3.4),
            SizedBox(width: AppSizes.spaceBtwItems),
            Text(
              "01 Nov, 2023",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),

        SizedBox(height: AppSizes.spaceBtwItems),

        /// Description

        ReadMoreText(
          "The User interface of the app is quite interactive, I was able to navigate and make purchages seamlessly, Great job is quite interactive, I was able to navigate and make purchages seamlessly, Great job",
          trimLines: 3,
          trimMode: TrimMode.Line,
          trimExpandedText: " show less",
          trimCollapsedText: "show more",
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary),
        ),

        SizedBox(
          height: AppSizes.spaceBtwItems,
        ),

        /// Reaponse review
        TRoundedContainer(
          backGroundColor: dark ? AppColors.darkerGrey : AppColors.grey,
          child: Padding(
            padding: EdgeInsets.all(AppSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "T's Store",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "02 Nov, 2023",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),
                ReadMoreText(
                  "The User interface of the app is quite interactive, I was able to navigate and make purchages seamlessly, Great job is quite interactive, I was able to navigate and make purchages seamlessly, Great job",
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  trimExpandedText: " show less",
                  trimCollapsedText: "show more",
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
      ],
    );
  }
}
