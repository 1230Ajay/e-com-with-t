import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapp/comman/widgets/success_screen/success_screen.dart';
import 'package:tapp/core/utils/constants/app_routes.dart';
import 'package:tapp/core/utils/constants/images.dart';
import 'package:tapp/core/utils/constants/sizes.dart';
import 'package:tapp/core/utils/constants/texts.dart';
import 'package:tapp/presentation/features/authentication/cubit/auth_cubit.dart';
import 'package:tapp/presentation/features/authentication/screens/sign-up/cubit/sign_up_cubit.dart';
import 'package:tapp/presentation/features/authentication/screens/sign-up/cubit/sign_up_state.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  Future<void> _sendEmailVerificationEmail(BuildContext context) async {
    await context.read<SignUpCubit>().sendEmailVerificationEmail();
  }

  @override
  Future<void> didChangeDependencies() async {
    await _sendEmailVerificationEmail(context);
  }

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
            icon:
                Icon(CupertinoIcons.clear), // Replace with any icon you prefer
          )
        ],
      ),
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state.emailVerificationState == EmailVerificationState.SUCCESS) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SuccessScreen(
                  image: TImages.staticSuccessIllustration,
                  title: TTexts.yourAccountCreatedTitle,
                  subtitle: TTexts.yourAccountCreatedSubTitle,
                  onPress: () {
                    Navigator.of(context).pushNamed(AppRoutes.HOME_MENU);
                  },
                ),
              ),
            );
          }
        },
        child: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(AppSizes.defaultSpace),
                child: Column(
                  children: [
                    /// Image
                    Image(
                        image: AssetImage(TImages.deliveredEmailIllustration)),

                    /// Title & Subtitle
                    Text(
                      TTexts.confirmEmail,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        if (state is AuthAuthenticated) {
                          Text(
                            "${state.user.email}",
                            style: Theme.of(context).textTheme.labelLarge,
                            textAlign: TextAlign.center,
                          );
                        }
                        return SizedBox();
                      },
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),

                    Text(
                      TTexts.confirmEmailSubTitle,
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SuccessScreen(
                                          image:
                                              TImages.staticSuccessIllustration,
                                          title: TTexts.yourAccountCreatedTitle,
                                          subtitle:
                                              TTexts.yourAccountCreatedSubTitle,
                                          onPress: () {},
                                        )));
                          },
                          child: Text(TTexts.tContinue)),
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwSections,
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: state.emailVerificationState ==
                                EmailVerificationState.EMAIL_SENT
                            ? Text(
                                state.emailVerificationTimeout.toString(),
                                style: Theme.of(context).textTheme.titleLarge,
                              )
                            : TextButton(
                                onPressed: () async {
                                  await _sendEmailVerificationEmail(context);
                                },
                                child: Text(TTexts.resendEmail)),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
