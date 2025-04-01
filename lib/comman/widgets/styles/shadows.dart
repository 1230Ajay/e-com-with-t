import 'package:flutter/cupertino.dart';

import '../../../core/utils/constants/colors.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: AppColors.darkerGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final HorizontalProductShadow = BoxShadow(
      color: AppColors.darkerGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
