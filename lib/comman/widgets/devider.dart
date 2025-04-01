import 'package:flutter/material.dart';

import '../../core/utils/constants/colors.dart';
import '../../core/utils/helpers/helper_functions.dart';

class TDevider extends StatelessWidget {
  final String lableText;
  const TDevider({
    super.key,
    required this.lableText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
          color: THelperFunctions.isDarkMode(context)
              ? AppColors.darkerGrey
              : AppColors.grey,
          thickness: 0.5,
          indent: 30,
          endIndent: 5,
        )),
        Text(
          lableText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
            child: Divider(
          color: THelperFunctions.isDarkMode(context)
              ? AppColors.darkerGrey
              : AppColors.grey,
          thickness: 0.5,
          indent: 5,
          endIndent: 30,
        )),
      ],
    );
  }
}
