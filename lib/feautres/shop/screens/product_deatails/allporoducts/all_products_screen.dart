import 'package:e_commerce_app/common/tproductcard_vertical.dart';
import 'package:e_commerce_app/common/widgets/customappbar.dart';
import 'package:e_commerce_app/common/widgets/grid_ayout.dart';
import 'package:e_commerce_app/feautres/shop/screens/product_deatails/product_rating_reviews/widgets/sortable_products.dart';
import 'package:e_commerce_app/feautres/shop/screens/product_deatails/widgets/tproduct_attributes.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text('All Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TSortableProducts(),
      )),
    );
  }
}
