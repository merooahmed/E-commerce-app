import 'package:e_commerce_app/common/styles/box_shadow.dart';
import 'package:e_commerce_app/common/widgets/brandtitlewithverfiedicon.dart';
import 'package:e_commerce_app/common/widgets/tcirculer_icon.dart';
import 'package:e_commerce_app/common/widgets/tproduct_price_text.dart';
import 'package:e_commerce_app/common/widgets/tproducttittle_text.dart';
import 'package:e_commerce_app/common/widgets/trounded_container.dart';
import 'package:e_commerce_app/common/widgets/troundedimage.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductHorizontalCard extends StatelessWidget {
  const TProductHorizontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Container(
        width: 320,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkGrey : TColors.softGrey),
        child: Row(
          children: [
            TRoundedContainer(
              height: 150,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.white,
              child: Stack(
                children: [
                  const TRoundedImage(
                    imageUrl: TImages.productImage1,
                    applyImageRadius: true,
                  ),
                  Positioned(
                    top: 7,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.xs, vertical: TSizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: TCirculerIcon(
                        icon: Iconsax.heart5,
                        iconColor: Colors.red,
                      )),
                ],
              ),
            ),
            const SizedBox(
              width: TSizes.sm,
            ),
            SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTittleText(
                          tittle: 'Green NikE Air Shoesjjjjjjjjjjjjjj',
                          smallsize: true,
                          maxlines: 1,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems / 2,
                        ),
                        TBrandTittleWithVerfiedIcon(
                          tittle: "Nike",
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems / 2,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TproductPriceText(
                        price: '35',
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(TSizes.cardRadiusMd),
                                bottomRight: Radius.circular(
                                    TSizes.productImageRadius))),
                        child: SizedBox(
                          height: TSizes.iconLg * 1.2,
                          width: TSizes.iconLg * 1.2,
                          child: Center(
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Iconsax.add,
                                  color: TColors.white,
                                )),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
