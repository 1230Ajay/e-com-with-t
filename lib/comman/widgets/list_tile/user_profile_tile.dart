import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tapp/core/utils/constants/app_routes.dart';
import 'package:tapp/presentation/features/authentication/cubit/auth_cubit.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/images.dart';
import '../images/circullar_image.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if(state is AuthAuthenticated){
          return  ListTile(
            leading: TCircularImage(
              image: state.user.photoURL??"",
              isNetworkImage: true,
              width: 50,
              height: 50,
              padding: EdgeInsets.zero,
            ),
            title: Text(
              "${state.user.displayName}",
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall
                  ?.apply(color: AppColors.white),
            ),
            subtitle: Text(
              "${state.user.email}",
              style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall
                  ?.apply(
                  color: AppColors.white, overflow: TextOverflow.ellipsis),
              maxLines: 1,
            ),
            trailing: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.PROFILE);
                },
                icon: Icon(
                  Iconsax.edit,
                  color: Colors.white,
                )),
          );
        }

        return SizedBox();
      },
    );
  }
}
