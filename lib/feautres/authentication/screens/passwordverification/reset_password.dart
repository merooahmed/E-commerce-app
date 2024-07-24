import 'package:e_commerce_app/feautres/authentication/controllers/forgetpassword/forget_password_controller.dart';
import 'package:e_commerce_app/feautres/authentication/screens/login/login.dart';
import 'package:e_commerce_app/feautres/authentication/screens/passwordverification/forgetpassword_screen.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
        IconButton(
            onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            Image(
              image: const AssetImage(
                TImages.deliveredEmailIllustration,
              ),
              width: TDeviceUtils.getScreenWidth(context) * 0.6,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections / 2,
            ),
            Text(
              email,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TTexts.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TTexts.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => const LoginScreeen());
                  },
                  child: const Text(TTexts.done)),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () {
                    ForgetPasswordController.instance
                        .resendPasswordResetEmail(email);
                  },
                  child: const Text(TTexts.resendEmail)),
            ),
          ]),
        ),
      ),
    );
  }
}
