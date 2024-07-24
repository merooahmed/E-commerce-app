import 'package:e_commerce_app/common/widgets/circular_image.dart';
import 'package:e_commerce_app/common/widgets/customappbar.dart';
import 'package:e_commerce_app/common/widgets/tshimmer_widget.dart';
import 'package:e_commerce_app/feautres/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/profile/widgets/changename.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/profile/widgets/tprofilemenu.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/tsectionheader.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileInfo extends StatelessWidget {
  UserProfileInfo({super.key});
  final controller = UserController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : TImages.user;
                      return controller.imageUploading.value
                          ? const TshimmerEffect(
                              height: 80,
                              width: 80,
                              radius: 80,
                            )
                          : TCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              padding: 0,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () {
                          controller.uploadUserProfileImage();
                        },
                        child: const Text('Change profile picture')),
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const TSectionHeader(
                title: 'Profile Information',
                showactionbutton: false,
              ),
              TProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onpressed: () => Get.to(() => ChangeName()),
              ),
              TProfileMenu(
                title: 'UserName',
                value: controller.user.value.userName,
                onpressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeader(
                title: 'Personal Information',
                showactionbutton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'User Id',
                value: controller.user.value.id.toString(),
                onpressed: () {},
                icon: Iconsax.copy,
              ),
              TProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onpressed: () {},
              ),
              TProfileMenu(
                title: 'Phone number',
                value: controller.user.value.phoneNumber,
                onpressed: () {},
              ),
              TProfileMenu(
                title: 'Gender',
                value: 'Male',
                onpressed: () {},
              ),
              TProfileMenu(
                title: 'Date of birth',
                value: '10 oct,1994',
                onpressed: () {},
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    controller.deleteAccountPopUP();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
