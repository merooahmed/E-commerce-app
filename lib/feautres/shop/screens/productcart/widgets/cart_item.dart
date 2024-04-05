import 'package:e_commerce_app/common/widgets/brandtitke_text.dart';
import 'package:e_commerce_app/common/widgets/brandtitlewithverfiedicon.dart';
import 'package:e_commerce_app/common/widgets/troundedimage.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          imageUrl: TImages.productImage10,
          height: 80,
          width: 80,
          backgroundcolor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
          padding: const EdgeInsets.all(TSizes.sm),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TBrandTittleWithVerfiedIcon(tittle: 'Nike'),
            const TBrandTittleText(title: 'Black sports shoes '),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: 'Color ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Green  ',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'UK 08',
                    style: Theme.of(context).textTheme.bodyLarge),
              ]),
            ),
          ],
        ),
      ],
    );
  }
}
