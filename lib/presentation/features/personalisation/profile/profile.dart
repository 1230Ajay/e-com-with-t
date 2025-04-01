import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tapp/comman/widgets/appbar/appbar.dart';
import 'package:tapp/comman/widgets/images/circullar_image.dart';
import 'package:tapp/comman/widgets/texts/heading.dart';
import 'package:tapp/presentation/features/personalisation/profile/widgets/profile_menu.dart';

import 'package:tapp/core/utils/constants/images.dart';
import 'package:tapp/core/utils/constants/sizes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// --- AppBar

      appBar: TAppBar(
        title: Text(
          "Profile",
        ),
        showBackArrow: true,
      ),

      /// --- Body
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                /// Profile Picture
                TCircularImage(image: TImages.user),
                TextButton(
                    onPressed: () {}, child: Text("Change profile picture")),

                const SizedBox(
                  height: AppSizes.spaceBtwItems / 2,
                ),
                Divider(),
                const SizedBox(
                  height: AppSizes.spaceBtwItems / 2,
                ),

                ///  Details
                TSectionHeading(
                  title: "Profile Information",
                  showActionButton: false,
                ),

                const SizedBox(
                  height: AppSizes.spaceBtwItems / 2,
                ),

                ProfileMenu(
                  title: "Name",
                  value: "Ajay Malah",
                  onPressed: () {},
                ),
                ProfileMenu(
                  title: "Username",
                  value: "ajay1101",
                  onPressed: () {},
                ),

                const SizedBox(
                  height: AppSizes.spaceBtwItems / 2,
                ),
                Divider(),
                const SizedBox(
                  height: AppSizes.spaceBtwItems / 2,
                ),
                TSectionHeading(
                  title: "Personal Information",
                  showActionButton: false,
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItems / 2,
                ),

                ProfileMenu(
                  title: "User Id",
                  value: "2734595733",
                  onPressed: () {},
                  icon: Iconsax.copy,
                ),
                ProfileMenu(
                  title: "E-Mail",
                  value: "arryroy1101@gmail.com",
                  onPressed: () {},
                ),
                ProfileMenu(
                  title: "Phone",
                  value: "+91 7489463450",
                  onPressed: () {},
                ),
                ProfileMenu(
                  title: "Gender",
                  value: "Male",
                  onPressed: () {},
                ),
                ProfileMenu(
                  title: "DOB",
                  value: "3 Apr 2003",
                  onPressed: () {},
                ),

                const SizedBox(
                  height: AppSizes.spaceBtwItems / 2,
                ),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {}, child: Text("Close Account")),
                )
              ],
            )),
      ),
    );
  }
}
