import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tapp/core/utils/constants/sizes.dart';

import '../../../../../core/utils/constants/colors.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    this.icon = Iconsax.arrow_right_34,
    required this.onPressed,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final void Function() onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems / 1.5),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.apply(color: AppColors.darkerGrey),
                overflow: TextOverflow.ellipsis,
              )),
          Expanded(
              flex: 5,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              )),
          Icon(
            icon,
            size: 14,
          ),
        ],
      ),
    );
  }
}
