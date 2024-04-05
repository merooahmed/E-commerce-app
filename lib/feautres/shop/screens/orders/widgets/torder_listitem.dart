import 'package:e_commerce_app/common/widgets/trounded_container.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItem extends StatelessWidget {
  const TOrderListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
        itemBuilder: (_, index) => TRoundedContainer(
              showBorder: true,
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(Iconsax.ship),
                    title: Text(
                      'Processing',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: TColors.primary, fontSizeDelta: 1),
                    ),
                    subtitle: Text(
                      '07 Nov 2024',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.arrow_right_34,
                          size: TSizes.iconSm,
                        )),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: const Icon(Iconsax.tag),
                          title: Text('Order',
                              style: Theme.of(context).textTheme.labelMedium),
                          subtitle: Text(
                            '[#25f25]',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: const Icon(Iconsax.calendar),
                          title: Text('Shipping Date',
                              style: Theme.of(context).textTheme.labelMedium),
                          subtitle: Text(
                            '03 feb 2025',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
        separatorBuilder: (_, __) => const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
        itemCount: 10);
  }
}
