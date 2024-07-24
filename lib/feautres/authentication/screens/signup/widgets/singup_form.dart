import 'package:e_commerce_app/feautres/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce_app/feautres/authentication/screens/signup/widgets/signup_button.dart';
import 'package:e_commerce_app/feautres/authentication/screens/signup/widgets/termscheck_section.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SingUPForm extends StatelessWidget {
  SingUPForm({
    super.key,
  });
  final controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.signUpFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstNameController,
                    validator: (value) =>
                        TValidator.validateEmptyText(value, 'first name'),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: TTexts.firstName,
                    ),
                  ),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwInputFields,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastNameController,
                    validator: (value) =>
                        TValidator.validateEmptyText(value, 'last name'),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: TTexts.lastName,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: controller.userNameController,
              validator: (value) =>
                  TValidator.validateEmptyText(value, 'username'),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.user_edit),
                labelText: TTexts.username,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              validator: (value) => TValidator.validateEmail(value),
              controller: controller.emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: controller.phoneNumberController,
              validator: (value) => TValidator.validatePhoneNumber(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.call),
                labelText: TTexts.phoneNo,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Obx(
              () => TextFormField(
                validator: (value) => TValidator.validatePassword(value),
                obscureText: controller.passwordHidden.value,
                controller: controller.passwordcontroller,
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
              height: TSizes.spaceBtwSections,
            ),
           TermsAndPrivacyCheckSection(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SignUPButton(),
          ],
        ));
  }
}
