import 'package:e_commerce_app/feautres/authentication/controllers/forgetpassword/forget_password_controller.dart';
import 'package:e_commerce_app/feautres/authentication/screens/passwordverification/reset_password.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final forgetPasswordController = Get.put(ForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace * 2),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              TTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Form(
              key: forgetPasswordController.forgetPasswordformKey,
              child: TextFormField(
                controller: forgetPasswordController.emailConrtoller,
                validator: TValidator.validateEmail,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    forgetPasswordController.sendPasswordResetEmail();
                  },
                  child: const Text(TTexts.submit)),
            )
          ]),
        ),
      ),
    );
  }
}
