import 'package:e_commerce_app/common/widgets/customappbar.dart';
import 'package:e_commerce_app/common/widgets/success_screen.dart';
import 'package:e_commerce_app/common/widgets/trounded_container.dart';
import 'package:e_commerce_app/feautres/shop/screens/checkout/widgets/tbilling_amount_section.dart';
import 'package:e_commerce_app/feautres/shop/screens/checkout/widgets/tbilling_pyment_section.dart';
import 'package:e_commerce_app/feautres/shop/screens/checkout/widgets/tcuponcode.dart';
import 'package:e_commerce_app/feautres/shop/screens/productcart/widgets/cart_item.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OrderReviewScreen extends StatelessWidget {
  const OrderReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Order Review'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const CartItem(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const CartItem(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const TCuponCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TRoundedContainer(
                showBorder: true,
                backgroundColor: dark ? TColors.dark : TColors.light,
                padding: const EdgeInsets.all(TSizes.md),
                child: const Column(
                  children: [
                    TBillingAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    TBillingPaymentSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {
              Get.to(() => SuccessScreen(
                  headline: 'Payment Success!',
                  titleBody: 'Your item will be shipped soon',
                  image: TImages.successfulPaymentIcon,
                  onpressed: () => Get.offAll(BottomNavigationMenu())));
            },
            child: const Text('CheckOut \$256.0')),
      ),
    );
  }
}
