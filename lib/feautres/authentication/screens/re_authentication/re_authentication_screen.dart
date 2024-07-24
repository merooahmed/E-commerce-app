import 'package:e_commerce_app/feautres/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ReauthenticationScreen extends StatelessWidget {
  ReauthenticationScreen({super.key});
  final controller = UserController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Re-authenticate User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          TSizes.defaultSpace,
        ),
        child: Column(
          children: [
            Form(
                key: controller.reauthKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.verfiyEmail,
                      validator: TValidator.validateEmail,
                      decoration: InputDecoration(
                        hintText: 'E-mail',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(TSizes.borderRadiusMd),
                        ),
                        prefixIcon: const Icon(Iconsax.direct_right),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      controller: controller.verfiyPassword,
                      validator: TValidator.validatePassword,
                      decoration: InputDecoration(
                        hintText: 'password',
                        hintStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(TSizes.borderRadiusMd),
                        ),
                        prefixIcon: const Icon(Iconsax.password_check),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.reauthEmailAnPassword();
                        },
                        child: const Text('Verify'),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
