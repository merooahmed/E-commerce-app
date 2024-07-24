import 'package:e_commerce_app/feautres/authentication/controllers/signin/signin_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SocialMediaSection extends StatelessWidget {
  SocialMediaSection({
    super.key,
  });
  final signincontroller = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {
              signincontroller.googleSignIn();
            },
            icon: const Image(
                height: TSizes.iconMd,
                width: TSizes.md,
                image: AssetImage(TImages.google)),
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
                height: TSizes.iconLg,
                width: TSizes.lg,
                image: AssetImage(TImages.facebook)),
          ),
        ),
      ],
    );
  }
}
