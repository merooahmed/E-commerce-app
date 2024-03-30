import 'package:e_commerce_app/common/widgets/customappbar.dart';
import 'package:e_commerce_app/feautres/shop/screens/product_deatails/product_rating_reviews/widgets/overallproduct_rating.dart';
import 'package:e_commerce_app/feautres/shop/screens/product_deatails/product_rating_reviews/widgets/tratingidicator_bar.dart';
import 'package:e_commerce_app/feautres/shop/screens/product_deatails/product_rating_reviews/widgets/user_review_card.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewsandRating extends StatelessWidget {
  const ProductReviewsandRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Reviews & Rating'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'Rating and reviews are verified and are from people who buy the same product that you useggggkm heloo welcome.'),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            const TOverallProductRating(),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            const TRatingBarIndicator(
              rating: 3.5,
            ),
            Text(
              '12,611',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) => const TUserReviewCard(),
              physics: const NeverScrollableScrollPhysics(),
            )
          ],
        ),
      ),
    );
  }
}
