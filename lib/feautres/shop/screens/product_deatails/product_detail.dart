import 'package:e_commerce_app/feautres/shop/screens/product_deatails/product_rating_reviews/productsratingandreviews_screen.dart';
import 'package:e_commerce_app/feautres/shop/screens/product_deatails/widgets/tbottom_addtocart.dart';
import 'package:e_commerce_app/feautres/shop/screens/product_deatails/widgets/tproduct_attributes.dart';
import 'package:e_commerce_app/feautres/shop/screens/product_deatails/widgets/tproductimagesider.dart';
import 'package:e_commerce_app/feautres/shop/screens/product_deatails/widgets/tproductmetadata.dart';
import 'package:e_commerce_app/feautres/shop/screens/product_deatails/widgets/tratingandshare.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/tsectionheader.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(children: [
          const TProductImageSlider(),
          Padding(
            padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace),
            child: Column(
              children: [
                const TRatingandShare(),
                const TProductMetaData(),
                const TProductAttributes(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Check Out')),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const TSectionHeader(
                  title: 'Description',
                  showactionbutton: false,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const ReadMoreText(
                  'this product desc color blue size is available for all poeple there variety of colors and sizes take aroungtbhnmmmmmfkb mgk bgkbgbgbgggggggggmgooooooooooo hmhhhhhhhhhhhhhhhhhhhhhhhhh ,hhhhhhhhhhhhhhhhhhhhhhhhhmjykmm,onhkmmn',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'less',
                  moreStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),
                const Divider(),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TSectionHeader(
                      title: 'Reviews (199)',
                      showactionbutton: false,
                    ),
                    SizedBox(
                      child: IconButton(
                          onPressed: () {
                            Get.to(() => const ProductReviewsandRating());
                          },
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 20,
                            color: TColors.black,
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
