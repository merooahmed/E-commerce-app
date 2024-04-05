import 'package:e_commerce_app/common/tproductcard_vertical.dart';
import 'package:e_commerce_app/common/widgets/grid_ayout.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: const [
            'name',
            'Higher price',
            'lower price',
            'popularity',
            'Sale',
            'Newest'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: (value) {},
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        TGridLayout(
            itemcount: 4,
            itemBuilder: (_, index) => const TProductCardVertical())
      ],
    );
  }
}
