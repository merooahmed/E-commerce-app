import 'package:e_commerce_app/common/widgets/brandtitlewithverfiedicon.dart';
import 'package:e_commerce_app/common/widgets/circular_image.dart';
import 'package:e_commerce_app/common/widgets/trounded_container.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.showborder,
    this.ontap,
  });
  final bool showborder;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showborder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
                child: TCircularImage(
              image: TImages.clothIcon,
              backgroungcolor: Colors.transparent,
              overlaycolor: THelperFunctions.isDarkMode(context)
                  ? TColors.white
                  : TColors.black,
            )),
            const SizedBox(
              height: TSizes.spaceBtwItems / 1.5,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TBrandTittleWithVerfiedIcon(
                    tittle: "Nike",
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                      '256 products',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
