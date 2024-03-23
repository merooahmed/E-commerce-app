import 'package:flutter/material.dart';

class TproductPriceText extends StatelessWidget {
  const TproductPriceText(
      {super.key,
      this.currencySign = '  \$',
      required this.price,
      this.isLarge = false,
      this.lineThrough = false,
      this.maxlines = 1});
  final String currencySign, price;
  final bool isLarge, lineThrough;
  final int maxlines;
  @override
  Widget build(BuildContext context) {
    return Text(currencySign + price,
        maxLines: maxlines,
        overflow: TextOverflow.ellipsis,
        style: isLarge
            ? Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null)
            : Theme.of(context).textTheme.titleLarge!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null));
  }
}
