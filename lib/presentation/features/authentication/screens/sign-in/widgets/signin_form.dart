import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tapp/data/features/authentication/models/signin.dart';
import 'package:tapp/domain/features/authentication/usecases/signin_usecase.dart';
import 'package:tapp/presentation/features/authentication/screens/sign-in/cubit/signin_cubit.dart';
import 'package:tapp/service_locator.dart';
import 'package:tapp/core/utils/constants/app_routes.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/constants/texts.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SigninCubit>();
    return BlocListener<SigninCubit, SigninState>(
      listener: (context, state) {
        if(state.signInStatus == SignInStatus.SUCCESS){
          Navigator.of(context).pushNamed(AppRoutes.HOME_MENU);
        }
      },
      child: BlocBuilder<SigninCubit, SigninState>(
        builder: (context, state) {
          return Form(
              child: Column(
                children: [
                  TextFormField(
                    onChanged: cubit.updateEmail,
                    decoration: InputDecoration(
                        errorText: state.signInErrors["email"],
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: TTexts.username),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwInputFields),
                  TextFormField(
                    onChanged: cubit.updatePassword,
                    obscureText: !state.showPassword,
                    decoration: InputDecoration(
                      errorText: state.signInErrors["password"],
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: SizedBox(child: IconButton(onPressed: () async {
                          await cubit.updateShowPassword();
                        }, icon: Icon(state.showPassword?Iconsax.eye_slash:Iconsax.eye)),),
                        labelText: TTexts.password),
                  ),
                  /// REMEMBER ME AND FORGOT PASSWORD
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (value) {}),
                          const Text(TTexts.rememberMe)
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRoutes.FORGOT_PASSWORD);
                          },
                          child: Text(TTexts.forgetPassword))
                    ],
                  ),

                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: state.signInStatus == SignInStatus.RESQUEST_SENT? null:() async {
                            final res = await cubit.signIn();
                          },
                          child: state.signInStatus == SignInStatus.RESQUEST_SENT? SizedBox( height: AppSizes.iconSm,width: AppSizes.iconSm,child: CircularProgressIndicator()): Text(TTexts.signIn))
                  ),

                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),

                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.SIGNUP);
                          },
                          child: Text(TTexts.createAccount))),
                ],
              ));
        },
      ),
    );
  }


}
