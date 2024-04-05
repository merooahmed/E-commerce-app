import 'package:e_commerce_app/common/tproductcard_vertical.dart';

import 'package:e_commerce_app/common/widgets/grid_ayout.dart';

import 'package:e_commerce_app/common/widgets/tsearchcontainer.dart';
import 'package:e_commerce_app/feautres/shop/screens/product_deatails/allporoducts/all_products_screen.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/headercotainer.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/home_categories.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/homeappbar.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/promoslider.dart';

import 'package:e_commerce_app/feautres/shop/screens/widgets/tsectionheader.dart';

import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeader(
              child: Column(
                children: [
                  THomeAppBar(),
                  TSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeader(
                          title: 'Populer Categories',
                          showactionbutton: false,
                          textColor: TColors.white,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems * 2,
                        ),
                        THomeCategories()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TPromoSlider(banners: const [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3
                  ]),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSectionHeader(
                    title: 'Popular Product',
                    onpressed: () => Get.to(() => const AllProduct()),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TGridLayout(
                      itemcount: 6,
                      itemBuilder: ((_, index) => const TProductCardVertical()))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
