import 'package:e_commerce_app/common/widgets/trounded_container.dart';
import 'package:e_commerce_app/feautres/shop/screens/product_deatails/product_rating_reviews/widgets/tratingidicator_bar.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class TUserReviewCard extends StatelessWidget {
  const TUserReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isdark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage(TImages.userProfileImage1),
          ),
          title: Text(
            'John Doe',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing:
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '01,Nov,2023',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        const ReadMoreText(
          ' Rating and reviews are verified and are from people who buy the same product that you useggggkm heloo welcome.fltgktpohkbtpytgyplhyplhyplhpylbh; ghhpbjhpg',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'show more',
          trimExpandedText: 'less',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        TRoundedContainer(
          backgroundColor: isdark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'T Store',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      '02,Nov,2023',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const ReadMoreText(
                  ' Rating and reviews are verified and are from people who buy the same product that you useggggkm heloo welcome.frgjvrigktfothlvflvlgbm,,ggggggmbbmbbnmbmmvbm dfffvghpggp[frtf[g[]]]',
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'show more',
                  trimExpandedText: 'less',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
      ],
    );
  }
}
