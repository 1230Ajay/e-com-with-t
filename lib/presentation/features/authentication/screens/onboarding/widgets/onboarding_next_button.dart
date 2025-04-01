import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tapp/data/local/storage_service.dart';

import '../../../../../../core/utils/constants/app_routes.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../bloc/onboarding_bloc.dart';

class NextButton extends StatelessWidget {
  final PageController _pageController;
  final OnboardingState state;
  const NextButton(
    this._pageController,
    this.state, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: AppSizes.appBarHeight,
        right: AppSizes.defaultSpace,
        child: ElevatedButton(
          onPressed: () async {
            if ((state.page ?? 0) < 2) {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.bounceInOut,
              );
            } else {
              await StorageService.instance.setAppIsOpened();
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.SIGNIN,
                (route) => false,
              );
            }
          },
          style: ElevatedButton.styleFrom(shape: CircleBorder()),
          child: Icon(Iconsax.arrow_right_3),
        ));
  }
}
