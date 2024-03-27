import 'package:e_commerce_app/common/tproductcard_vertical.dart';
import 'package:e_commerce_app/common/widgets/customappbar.dart';
import 'package:e_commerce_app/common/widgets/grid_ayout.dart';
import 'package:e_commerce_app/common/widgets/tcirculer_icon.dart';
import 'package:e_commerce_app/feautres/shop/controllers/bottom_navigation_controller.dart';
import 'package:e_commerce_app/feautres/shop/screens/home.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCirculerIcon(
              icon: Iconsax.add,
              onPressed: () {
              BottomNavigationController.instance.selectedIndex.value = 0;
                
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: TGridLayout(
              itemcount: 10,
              itemBuilder: (_, index) => const TProductCardVertical()),
        ),
      ),
    );
  }
}
