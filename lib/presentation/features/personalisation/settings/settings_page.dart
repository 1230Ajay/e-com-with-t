import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tapp/comman/widgets/appbar/appbar.dart';
import 'package:tapp/comman/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:tapp/comman/widgets/texts/heading.dart';
import 'package:tapp/domain/features/shop/home/usecases/shop/categories.dart';
import 'package:tapp/presentation/features/authentication/cubit/auth_cubit.dart';
import 'package:tapp/presentation/features/personalisation/settings/widget/settings_menu_tile.dart';

import 'package:tapp/core/utils/constants/app_routes.dart';
import 'package:tapp/core/utils/constants/sizes.dart';
import 'package:tapp/service_locator.dart';

import '../../../../comman/widgets/list_tile/user_profile_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// --- Header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                  showBackArrow: false,
                  title: Text(
                    "Accounts",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.apply(color: Colors.white),
                  ),
                ),

                /// User Profile Card

                TUserProfileTile(),

                SizedBox(
                  height: AppSizes.spaceBtwSections,
                ),
              ],
            )),

            /// --- Body

            Padding(
              padding: EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  /// --- Accounts Settings

                  TSectionHeading(
                    title: "Accounts Setting",
                    showActionButton: false,
                  ),
                  SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: "My Address",
                    subtitle: "Set shopping dilivery adress",
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.USER_ADRESS);
                    },
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "My Cart",
                    subtitle: "Add remove products and move to checkout",
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.CART);
                    },
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Orders",
                    subtitle: "In-Progress and completed orders",
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.ORDERS);
                    },
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: "Bank Accounts",
                    subtitle: "Withdraw ballance to register bank account",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: "My Coupons",
                    subtitle: "List of the all disconted products",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: "Notifications",
                    subtitle: "set any kind of notification and manage",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: "Account Privacy",
                    subtitle: "Manage data usage and connectivity privacy",
                    onTap: () {},
                  ),
                  SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  TSectionHeading(
                    title: "App Settings",
                    showActionButton: false,
                  ),
                  SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Load Data",
                    subtitle: "Upload data to your cloud storage",
                    onTap: () async {
                     await ServiceLocator.instance.getIt<UploadCategoriesUseCase>().call(params: null);
                    },
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: "Geolocation",
                    subtitle: "Set recommendation based on your location",
                    onTap: () {},
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: "Safe Mode",
                    subtitle: "Search result is safe for all ages",
                    onTap: () {},
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: "HD Image Quality",
                    subtitle: "Set Image quality to high",
                    onTap: () {},
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child:
                        OutlinedButton(onPressed: () {
                           context.read<AuthCubit>().signOut();
                           Navigator.of(context).pushNamed(AppRoutes.SIGNIN);
                        }, child: Text("Logout")),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
