import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key,
    required this.price,
    this.currencyType = "\$",
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });

  final String price, currencyType;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencyType + price,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium?.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge?.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
