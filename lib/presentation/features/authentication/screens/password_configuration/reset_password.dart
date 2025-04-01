import 'package:flutter/material.dart';
import 'package:tapp/core/utils/constants/app_routes.dart';
import 'package:tapp/core/utils/constants/sizes.dart';
import 'package:tapp/core/utils/constants/texts.dart';

import '../../../../../core/utils/constants/images.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                /// Image with 60% Of screen width
                Image(image: AssetImage(TImages.deliveredEmailIllustration)),
                const SizedBox(
                  height: AppSizes.spaceBtwSections,
                ),
                /// Title & Subtitle
                Text(TTexts.changeYourPasswordTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),
                Text(
                  TTexts.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),

                /// Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(TTexts.done),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.SIGNIN);
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
