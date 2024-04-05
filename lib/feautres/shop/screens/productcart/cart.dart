import 'package:e_commerce_app/common/widgets/brandtitke_text.dart';
import 'package:e_commerce_app/common/widgets/brandtitlewithverfiedicon.dart';
import 'package:e_commerce_app/common/widgets/customappbar.dart';
import 'package:e_commerce_app/common/widgets/tcircular_container.dart';
import 'package:e_commerce_app/common/widgets/tcirculer_icon.dart';
import 'package:e_commerce_app/common/widgets/tproduct_price_text.dart';
import 'package:e_commerce_app/common/widgets/troundedimage.dart';
import 'package:e_commerce_app/feautres/shop/screens/checkout/orderreview_screen.dart';
import 'package:e_commerce_app/feautres/shop/screens/productcart/widgets/cart_item.dart';
import 'package:e_commerce_app/feautres/shop/screens/productcart/widgets/quatityofproduct.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Cart'),
        showBackArrow: true,
      ),
      body: ListView.separated(
          itemBuilder: (_, index) {
            return const Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace / 2),
              child: Column(
                children: [
                  CartItem(),
                  AddandMinusQuantityofProduct(),
                ],
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
          itemCount: 10),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {
              Get.to(() => const OrderReviewScreen());
            }, child: const Text('CheckOut \$256.0')),
      ),
    );
  }
}

