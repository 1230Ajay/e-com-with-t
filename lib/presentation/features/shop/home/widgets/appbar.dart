import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapp/core/utils/constants/app_routes.dart';
import 'package:tapp/presentation/features/authentication/cubit/auth_cubit.dart';

import '../../../../../comman/widgets/appbar/appbar.dart';
import '../../../../../comman/widgets/products/cart/cart_counter.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/texts.dart';

class THomeAppbar extends StatelessWidget {
  const THomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      showBackArrow: false,
      title: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TTexts.homeAppbarTitle,
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium
                    ?.apply(color: AppColors.grey),
              ),
              if(state is AuthAuthenticated) Text(
                state.user.displayName??"",
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall
                    ?.apply(color: AppColors.grey),
              )
            ],
          );
        },
      ),
      action: [
        TCartCounterIcon(
          iconColor: Colors.white,
          onPress: () => Navigator.of(context).pushNamed(AppRoutes.CART),
        )
      ],
    );
  }
}
