import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tapp/core/utils/constants/sizes.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar(
      {super.key,
      this.title,
      this.showBackArrow = true,
      this.leadingIcon,
      this.action,
      this.leadingOnPress});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? action;
  final Function? leadingOnPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.md,
      ),
      child: AppBar(
        title: title,
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Iconsax.arrow_left))
            : leadingIcon != null
                ? IconButton(
                    onPressed: () => leadingOnPress, icon: Icon(leadingIcon))
                : null,
        actions: action,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSizes.appBarHeight);
}
