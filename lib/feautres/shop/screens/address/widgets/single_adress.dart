import 'package:e_commerce_app/common/widgets/trounded_container.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      backgroundColor:
          isSelected ? TColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: isSelected
          ? Colors.transparent
          : dark
              ? TColors.darkerGrey
              : TColors.grey,
      showBorder: true,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'john Doe',
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Icon(
                  isSelected ? Iconsax.tick_circle : null,
                  color: isSelected
                      ? dark
                          ? TColors.light
                          : TColors.dark
                      : null,
                )
              ],
            ),
            const SizedBox(
              height: TSizes.sm,
            ),
            const Text(
              '(+123)456 985',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: TSizes.sm,
            ),
            const Text(
              ' 985,timy convas ,southliana,milano ,856544,USA',
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
