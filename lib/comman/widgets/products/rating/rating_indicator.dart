import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/colors.dart';

class TRatingBarIndicator extends StatelessWidget {
  const TRatingBarIndicator({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        itemSize: 20,
        unratedColor: AppColors.grey,
        rating: rating,
        itemCount: 5,
        itemBuilder: (_, __) => Icon(
              Iconsax.star1,
              color: AppColors.primary,
            ));
  }
}
