import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class TBrandTittleText extends StatelessWidget {
  const TBrandTittleText({
    super.key,
    this.color,
    required this.title,
    this.maxlines=1,
    this.textalign=TextAlign.center,
     this.brandsizetext=TextSizes.small,
  });

  final Color? color;
  final String title;
  final int maxlines;
  final TextAlign? textalign;
  final TextSizes brandsizetext;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: brandsizetext==TextSizes.small?Theme.of(context).textTheme.labelMedium!.apply(color: color)
      : brandsizetext == TextSizes.medium 
      ?Theme.of(context).textTheme.bodyLarge!.apply(color: color)
      : brandsizetext==TextSizes.large?Theme.of(context).textTheme.titleLarge!.apply(color: color)
      : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
      textAlign: textalign,
    );
  }
}
