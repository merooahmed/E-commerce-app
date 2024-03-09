import 'package:flutter/material.dart';

class TProductTittleText extends StatelessWidget {
  const TProductTittleText({super.key, required this.tittle,  this.smallsize=false, this.textAlign=TextAlign.left,  this.maxlines=2});
  final String tittle;
  final bool smallsize;
  final TextAlign? textAlign;
  final int maxlines;
  @override
  Widget build(BuildContext context) {
    return Text(tittle,
    overflow: TextOverflow.ellipsis,
    maxLines: maxlines,
    style: smallsize?Theme.of(context).textTheme.labelLarge:Theme.of(context).textTheme.titleSmall,
    textAlign: textAlign,);
  }
}
