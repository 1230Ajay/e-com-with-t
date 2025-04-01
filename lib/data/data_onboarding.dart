import 'package:tapp/core/utils/constants/images.dart';
import 'package:tapp/core/utils/constants/texts.dart';
import 'package:tapp/core/utils/entities/onboarding.dart';

class OnboardingData {
  OnboardingData._();
  static List<OnboardingEnitity> getOnboardingData() {
    List<Map<String, String>> data = [
      {
        "image": TImages.onBoardingImage1,
        "title": TTexts.onBoardingTitle1,
        "subTitle": TTexts.onBoardingSubTitle1
      },
      {
        "image": TImages.onBoardingImage2,
        "title": TTexts.onBoardingTitle2,
        "subTitle": TTexts.onBoardingSubTitle2
      },
      {
        "image": TImages.onBoardingImage3,
        "title": TTexts.onBoardingTitle3,
        "subTitle": TTexts.onBoardingSubTitle3
      }
    ];

    List<OnboardingEnitity> onboardingData = OnboardingEnitity.fromJson(data);
    return onboardingData;
  }
}
