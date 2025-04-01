import 'package:flutter/material.dart';
import 'package:tapp/presentation/features/shop/product_reviews/widgets/progress_indicator.dart';

class OverallProductRating extends StatelessWidget {
  const OverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            "4.8",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Expanded(
          flex: 8,
          child: Column(
            children: [
              TRatingProgressIndicator(
                text: "5",
                value: 5,
              ),
              TRatingProgressIndicator(
                text: "4",
                value: 4,
              ),
              TRatingProgressIndicator(
                text: "3",
                value: 3,
              ),
              TRatingProgressIndicator(
                text: "2",
                value: 2,
              ),
              TRatingProgressIndicator(
                text: "1",
                value: 1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
