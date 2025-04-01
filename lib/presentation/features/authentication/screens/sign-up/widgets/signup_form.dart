import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tapp/comman/widgets/popups/app_toast.dart';
import 'package:tapp/core/utils/constants/app_routes.dart';
import 'package:tapp/presentation/features/authentication/screens/sign-up/cubit/sign_up_cubit.dart';
import 'package:tapp/presentation/features/authentication/screens/sign-up/cubit/sign_up_state.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/constants/texts.dart';
import '../../../../../../core/utils/helpers/helper_functions.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Form(
            child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    expands: false,
                    initialValue: state.firstName,
                    onChanged: cubit.updateFirstName,
                    decoration: InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user),
                        errorText: state.validationErrors['firstName']),
                  ),
                ),
                const SizedBox(
                  width: AppSizes.spaceBtwInputFields,
                ),
                Flexible(
                  child: TextFormField(
                    initialValue: state.lastName,
                    expands: false,
                    onChanged: cubit.updateLastName,
                    decoration: InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user),
                        errorText: state.validationErrors["lastName"]),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),
            TextFormField(
              initialValue: state.username,
              expands: false,
              onChanged: cubit.updateUsername,
              decoration: InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit),
                  errorText: state.validationErrors['username']),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),
            TextFormField(
              initialValue: state.email,
              onChanged: cubit.updateEmail,
              expands: false,
              decoration: InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct),
                errorText: state.validationErrors["email"],
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),
            TextFormField(
              initialValue: state.phoneNo,
              onChanged: cubit.updatePhoneNo,
              expands: false,
              decoration: InputDecoration(
                  labelText: TTexts.phoneNo,
                  prefixIcon: Icon(Iconsax.call),
                  errorText: state.validationErrors["phoneNo"]),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),
            TextFormField(
              expands: false,
              initialValue: state.password,
              onChanged: cubit.updatePassword,
              decoration: InputDecoration(
                errorText: state.validationErrors['password'],
                labelText: TTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: SizedBox(
                  width: 40, // Adjust width to control button size
                  height: 40, // Adjust height if needed
                  child: IconButton(
                    onPressed: cubit.togglePasswordVisibility,
                    icon: Icon(
                      state.showPassword ? Iconsax.eye_slash : Iconsax.eye,
                    ),
                    padding: EdgeInsets.zero, // Removes extra padding
                  ),
                ),
              ),
              obscureText: !state.showPassword, // Fix obscureText logic
            ),
            SizedBox(height: AppSizes.spaceBtwItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                    value: state.agreedToTerms,
                    onChanged: cubit.updateAgreementStatus),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: TTexts.iAgreeTo,
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text: TTexts.privacyPolicy,
                      style: Theme.of(context).textTheme.labelLarge?.apply(
                          color: THelperFunctions.isDarkMode(context)
                              ? AppColors.white
                              : AppColors.primary,
                          decoration: TextDecoration.underline)),
                  TextSpan(
                      text: TTexts.and,
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text: TTexts.termsOfUse,
                      style: Theme.of(context).textTheme.labelLarge?.apply(
                          color: THelperFunctions.isDarkMode(context)
                              ? AppColors.white
                              : AppColors.primary,
                          decoration: TextDecoration.underline)),
                ]))
              ],
            ),
            SizedBox(height: AppSizes.spaceBtwItems),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                     final result =  await cubit.submitSignUpForm();
                     result.fold((error){}, (_){
                       Navigator.of(context).pushNamed(AppRoutes.VERIFY_EMAIL);
                     });
                    },
                    child: state.signUpFormState == SignUpFormState.INITIAL ? Text( TTexts.createAccount):SizedBox(
                      height: AppSizes.iconSm,
                      width: AppSizes.iconSm,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: AppColors.light,
                      ),
                    )
                )
            )
          ],
        ));
      },
    );
  }
}
