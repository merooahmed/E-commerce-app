import 'package:e_commerce_app/common/widgets/customappbar.dart';
import 'package:e_commerce_app/feautres/shop/screens/address/addnew_address_screen.dart';
import 'package:e_commerce_app/feautres/shop/screens/address/widgets/single_adress.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: TColors.primary,
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      appBar: const CustomAppBar(
        title: Text('Addresses'),
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        
        child: Column(
          children: [
            TSingleAddress(isSelected: true),
            TSingleAddress(isSelected: false),
          ],
        ),
        
        ),

      ),
    );
  }
}
