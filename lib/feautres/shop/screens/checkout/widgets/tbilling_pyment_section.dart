import 'package:e_commerce_app/common/widgets/trounded_container.dart';
import 'package:e_commerce_app/common/widgets/troundedimage.dart';
import 'package:e_commerce_app/feautres/authentication/screens/login/widgets/header_section.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/tsectionheader.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeader(
          title: 'payment method',
          buttonTittle: 'change',
          onpressed: () {},
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            TRoundedContainer(
              height: 60,
              width: 35,
              backgroundColor: THelperFunctions.isDarkMode(context)
                  ? TColors.light
                  : TColors.white,
              child: const Image(
                image: AssetImage(TImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text(
              'paypal',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        TSectionHeader(
          title: 'Shipping Address',
          buttonTittle: 'change',
          onpressed: () {},
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Text(
          'Coding With T',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              size: 16,
              color: Colors.grey,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text('+91- 123-456-7890',
                style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              size: 16,
              color: Colors.grey,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text('New York, USA', style: Theme.of(context).textTheme.bodyMedium)
          ],
        )
      ],
    );
  }
}
