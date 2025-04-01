import 'package:flutter/material.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        isScrollable: true,
        indicatorColor: AppColors.primary,
        labelColor: THelperFunctions.isDarkMode(context)
            ? AppColors.white
            : AppColors.primary,
        tabs: tabs);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
