import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tapp/core/utils/constants/app_routes.dart';
import 'package:tapp/core/utils/constants/sizes.dart';
import 'package:tapp/core/utils/constants/texts.dart';
import 'package:tapp/presentation/features/authentication/screens/password_configuration/cubit/forgot_password_cubit.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});


  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
            listener: (context, state) {
             if(state.forgotPasswordEmailStatus == ForgotPasswordEmailStatus.SENT){
               Navigator.of(context).pushNamed(AppRoutes.RESET_PASSWORD);
             }
            },
            child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Headings
                    Text(TTexts.forgetPasswordTitle,
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    Text(TTexts.forgetPasswordSubTitle,
                        style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(height: AppSizes.spaceBtwSections * 2),

                    /// Text Field
                    TextFormField(
                      onChanged: cubit.updateEmail,
                      decoration: InputDecoration(
                          errorText: state.forgotPasswordErrors["email"],
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: TTexts.email
                      ),
                    ),
                    const SizedBox(height: AppSizes.spaceBtwSections),

                    /// Submit Button
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              await cubit.sendResetPasswordEmail();
                            },
                            child: Text(TTexts.submit))),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
