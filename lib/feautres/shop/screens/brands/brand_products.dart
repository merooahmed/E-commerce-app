import 'package:e_commerce_app/common/widgets/customappbar.dart';
import 'package:e_commerce_app/common/widgets/tbrand_card.dart';
import 'package:e_commerce_app/feautres/shop/screens/product_deatails/product_rating_reviews/widgets/sortable_products.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text('Nike'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(showborder: true),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
