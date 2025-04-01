import 'package:flutter/material.dart';
import 'package:tapp/comman/widgets/devider.dart';
import 'package:tapp/comman/widgets/social_buttons.dart';
import 'package:tapp/presentation/features/authentication/screens/sign-up/widgets/signup_form.dart';

import 'package:tapp/core/utils/constants/sizes.dart';
import 'package:tapp/core/utils/constants/texts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showPass = false;
  bool showReEnterPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              /// Sign Up Form
              SignUpForm(),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),

              TDevider(lableText: TTexts.orSignUpWith),
              TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
