import 'package:e_commerce_app/common/tproductcard_vertical.dart';
import 'package:e_commerce_app/common/widgets/grid_ayout.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/brand_show_case.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/tsectionheader.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TcategoryTab extends StatelessWidget {
  const TcategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const TbrandShowCase(
                  images: [
                    TImages.productImage1,
                    TImages.productImage2,
                    TImages.productImage3
                  ],
                ),
                TSectionHeader(
                  title: 'You might Like',
                  onpressed: () {},
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                TGridLayout(
                  itemcount: 4,
                  itemBuilder: (_, index) => const TProductCardVertical(),
                )
              ],
            ),
          ),
        ]);
  }
}
