import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tapp/comman/widgets/appbar/appbar.dart';
import 'package:tapp/core/utils/constants/app_routes.dart';
import 'package:tapp/core/utils/constants/colors.dart';
import 'package:tapp/core/utils/constants/sizes.dart';

import '../settings/widget/single_address.dart';

class UserAddress extends StatelessWidget {
  const UserAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            {Navigator.of(context).pushNamed(AppRoutes.ADD_NEW_ADDRESS)},
        backgroundColor: AppColors.primary,
        child: Icon(
          Iconsax.add,
          color: AppColors.white,
        ),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Address"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              TSingleAddress(
                selectedAddress: false,
              ),
              TSingleAddress(
                selectedAddress: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
