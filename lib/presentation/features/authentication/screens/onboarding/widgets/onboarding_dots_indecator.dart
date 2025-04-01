import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';

class DotsIndicator extends StatelessWidget {
  final PageController pageController;
  const DotsIndicator(
    this.pageController, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: AppSizes.appBarHeight + AppSizes.defaultSpace,
      left: AppSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: pageController,
        count: 3,
        effect: ExpandingDotsEffect(
            activeDotColor: THelperFunctions.isDarkMode(context)
                ? AppColors.primary
                : AppColors.primary,
            dotHeight: 6),
      ),
    );
  }
}
