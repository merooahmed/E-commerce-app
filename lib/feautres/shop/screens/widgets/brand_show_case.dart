import 'package:e_commerce_app/common/widgets/tbrand_card.dart';
import 'package:e_commerce_app/common/widgets/trounded_container.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TbrandShowCase extends StatelessWidget {
  const TbrandShowCase({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.spaceBtwItems),
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          const TBrandCard(showborder: false),
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
      child: TRoundedContainer(
    height: 100,
    backgroundColor: THelperFunctions.isDarkMode(context)
        ? TColors.darkerGrey
        : TColors.light,
    margin: const EdgeInsets.only(right: TSizes.md),
    padding: const EdgeInsets.all(TSizes.md),
    child: Image(image: AssetImage(image)),
  ));
}
