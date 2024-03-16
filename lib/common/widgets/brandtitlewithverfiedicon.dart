

import 'package:e_commerce_app/common/widgets/brandtitke_text.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBrandTittleWithVerfiedIcon extends StatelessWidget {
  const TBrandTittleWithVerfiedIcon({
    super.key, required this.tittle,  this.maxlines=1, this.textColor, this.iconcolor= TColors.primary, this.textalign=TextAlign.center, this.brandTextSize=TextSizes.small,
  });
  final String tittle;
  final int maxlines;
  final Color? textColor, iconcolor;
  final TextAlign? textalign;
  final TextSizes brandTextSize;
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TBrandTittleText(
          title: tittle,
          textalign: textalign,
          maxlines: maxlines,
          color: textColor,
          brandsizetext: brandTextSize,
        ),
        const Icon(
          Iconsax.verify5,
          color: TColors.primary,
          size: TSizes.iconXs,
        )
      ],
    );
  }
}


