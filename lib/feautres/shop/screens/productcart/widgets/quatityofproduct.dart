import 'package:e_commerce_app/common/widgets/tcirculer_icon.dart';
import 'package:e_commerce_app/common/widgets/tproduct_price_text.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddandMinusQuantityofProduct extends StatelessWidget {
  const AddandMinusQuantityofProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 85,
            ),
            TCirculerIcon(
              icon: Iconsax.minus,
              height: 32,
              width: 32,
              size: TSizes.md,
              iconColor: THelperFunctions.isDarkMode(context)
                  ? TColors.white
                  : TColors.black,
              backgroundcolor: THelperFunctions.isDarkMode(context)
                  ? TColors.darkerGrey
                  : TColors.light,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '2',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            TCirculerIcon(
              icon: Iconsax.add,
              height: 32,
              width: 32,
              size: TSizes.md,
              iconColor: THelperFunctions.isDarkMode(context)
                  ? TColors.white
                  : TColors.black,
              backgroundcolor: THelperFunctions.isDarkMode(context)
                  ? TColors.darkerGrey
                  : TColors.light,
            ),
          ],
        ),
        const TproductPriceText(price: '256')
      ],
    );
  }
}
