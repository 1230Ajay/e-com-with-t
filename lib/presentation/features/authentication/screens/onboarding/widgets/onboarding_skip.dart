import 'package:flutter/material.dart';
import 'package:tapp/core/utils/constants/app_routes.dart';
import 'package:tapp/core/utils/constants/texts.dart';
import 'package:tapp/data/local/storage_service.dart';

import '../../../../../../core/utils/constants/sizes.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: AppSizes.defaultSpace,
        right: AppSizes.spaceBtwItems,
        child: TextButton(
            onPressed: () async {
              await  StorageService.instance.setAppIsOpened();
              Navigator.of(context).pushNamed(AppRoutes.SIGNIN);
            },
            child: const Text(TTexts.skip)));
  }
}
