import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors.dart';

class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Expanded(
          flex: 13,
          child: LinearProgressIndicator(
            value: value * .2,
            minHeight: 12,
            backgroundColor: AppColors.grey,
            borderRadius: BorderRadius.circular(7),
            valueColor: AlwaysStoppedAnimation(AppColors.primary),
          ),
        )
      ],
    );
  }
}
