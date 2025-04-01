import 'package:flutter/material.dart';
import 'package:tapp/comman/styles/spacing.dart';
import 'package:tapp/presentation/features/authentication/screens/sign-in/widgets/signin_form.dart';
import 'package:tapp/core/utils/constants/sizes.dart';
import 'package:tapp/core/utils/constants/texts.dart';
import 'package:tapp/core/utils/helpers/helper_functions.dart';

import '../../../../../comman/widgets/devider.dart';
import '../../../../../comman/widgets/social_buttons.dart';
import '../../../../../core/utils/constants/images.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpaceingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// LOGO
              SignInHeader(),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              /// FORM
              SignInForm(),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              /// Devider
              TDevider(lableText: TTexts.orSignInWith),
              const SizedBox(
                height: AppSizes.spaceBtwSections - 12,
              ),

              /// ICON BUTTONS
              TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}

class SignInHeader extends StatelessWidget {
  const SignInHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 120,
            image: AssetImage(THelperFunctions.isDarkMode(context)
                ? TImages.lightAppLogo
                : TImages.darkAppLogo)),
        Text(
          TTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          TTexts.loginSubTitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
