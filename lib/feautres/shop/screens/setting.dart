import 'package:e_commerce_app/common/widgets/customappbar.dart';
import 'package:e_commerce_app/feautres/shop/screens/address/useraddress_screen.dart';
import 'package:e_commerce_app/feautres/shop/screens/orders/myorders_screen.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/headercotainer.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/profile/screens/user_profile_screen.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/profile/widgets/tsettingmenu_tile.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/profile/widgets/userprofiletitle.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/tsectionheader.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeader(
                height: 250,
                child: Column(
                  children: [
                    CustomAppBar(
                      title: Text(
                        'Account',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: TColors.white),
                      ),
                    ),
                    TUserProfileWidgets(
                      onPressed: () => Get.to(() => const UserProfileInfo()),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeader(
                    title: 'Account Setting',
                    showactionbutton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TsettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subtitle: 'set shopping delivery address',
                    onTap: () {
                      Get.to(() => const UserAddressScreen());
                    },
                  ),
                  TsettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subtitle: 'set shopping delivery address',
                    onTap: () {},
                  ),
                  TsettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add,remove products and move to checkout',
                    onTap: () {},
                  ),
                  TsettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'In progress and completed orders',
                    onTap: () {
                      Get.to(() => const MyOrders());
                    },
                  ),
                  TsettingMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subtitle: 'withdraw balancd to registered bank account',
                    onTap: () {},
                  ),
                  TsettingMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subtitle: 'list of all discount coupon',
                    onTap: () {},
                  ),
                  TsettingMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subtitle: 'set any kind of notification message',
                    onTap: () {},
                  ),
                  TsettingMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account privacy',
                    subtitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeader(
                    title: 'App Setting ',
                    showactionbutton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const TsettingMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'load data',
                      subtitle: 'Upload Data to your cloud firebase'),
                  TsettingMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TsettingMenuTile(
                      icon: Iconsax.security_user,
                      title: 'safe Mode',
                      subtitle: 'Search result is safe for all ages',
                      trailing: Switch(value: false, onChanged: (value) {})),
                  TsettingMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'HD image Quality',
                      subtitle: 'set image quality to be seen',
                      trailing: Switch(value: false, onChanged: (value) {})),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('LogOut'),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
