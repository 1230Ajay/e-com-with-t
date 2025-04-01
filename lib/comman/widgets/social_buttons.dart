import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapp/presentation/features/authentication/screens/sign-in/cubit/signin_cubit.dart';

import '../../core/utils/constants/images.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SigninCubit _cubit = context.read<SigninCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () async {
           await _cubit.googleSignIn();
          },
          icon: Image(image: AssetImage(TImages.google)),
        ),
        IconButton(
          onPressed: () {},
          icon: Image(image: AssetImage(TImages.facebook)),
        ),
      ],
    );
  }
}
