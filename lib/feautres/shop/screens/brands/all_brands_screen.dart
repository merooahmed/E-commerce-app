import 'package:e_commerce_app/common/widgets/customappbar.dart';
import 'package:e_commerce_app/common/widgets/grid_ayout.dart';
import 'package:e_commerce_app/common/widgets/tbrand_card.dart';
import 'package:e_commerce_app/feautres/shop/screens/brands/brand_products.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/tsectionheader.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TSectionHeader(
                title: 'Brands',
                showactionbutton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TGridLayout(
                  mainAxisExtent: 120,
                  itemcount: 10,
                  itemBuilder: (_, index) => TBrandCard(
                        showborder: true,
                        ontap: () => Get.to(() => const BrandProducts()),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
