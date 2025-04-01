import 'package:flutter/material.dart';
import 'package:tapp/comman/styles/spacing.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/constants/texts.dart';

class SuccessScreen extends StatelessWidget {
  String image = "";
  String title = "";
  String subtitle = "";
  final Function onPress;

  SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpaceingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Image
              Image(image: AssetImage(image)),

              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              /// Title & Subtitle

              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              /// Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => onPress(), child: Text(TTexts.tContinue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
