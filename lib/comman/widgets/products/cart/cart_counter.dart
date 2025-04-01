import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/colors.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    this.onPress,
    this.iconColor,
  });

  final Function? onPress;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () => onPress!(),
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: Text("2",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.apply(color: AppColors.white, fontSizeFactor: .8)),
            ),
          ),
        )
      ],
    );
  }
}
