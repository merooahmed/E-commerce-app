import 'package:e_commerce_app/feautres/authentication/controllers/signin/signin_controller.dart';
import 'package:e_commerce_app/feautres/authentication/screens/passwordverification/forgetpassword_screen.dart';
import 'package:e_commerce_app/feautres/authentication/screens/signup/signup.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FormSection extends StatelessWidget {
  FormSection({
    super.key,
  });
  final controller = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signInFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) =>
                  TValidator.validateEmptyText(value, 'email'),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Obx(
              () => TextFormField(
                validator: (value) => TValidator.validatePassword(value),
                obscureText: controller.passwordHidden.value,
                controller: controller.password,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                      icon: controller.passwordHidden.value
                          ? const Icon(Iconsax.eye_slash)
                          : const Icon(Iconsax.eye),
                      onPressed: () => controller.passwordHidden.value =
                          !controller.passwordHidden.value),
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (Value) {
                            controller.rememberMe.value =
                                !controller.rememberMe.value;
                          }),
                    ),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => ForgetPassword());
                    },
                    child: const Text(TTexts.forgetPassword))
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    controller.signIn();
                  },
                  child: const Text(TTexts.signIn)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => const SignUp());
                  },
                  child: const Text(TTexts.createAccount)),
            ),
          ],
        ),
      ),
    );
  }
}
