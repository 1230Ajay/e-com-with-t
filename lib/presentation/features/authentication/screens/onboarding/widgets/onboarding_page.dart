import 'package:flutter/material.dart';
import 'package:tapp/core/utils/entities/onboarding.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingEnitity data;
  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            image: AssetImage(data.image),
            width: THelperFunctions.screenWidth(context) * 0.8,
            height: THelperFunctions.screenHeight(context) * 0.6,
          ),
          Text(
            data.title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: AppSizes.spaceBtwItems,
          ),
          Text(data.subTitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
