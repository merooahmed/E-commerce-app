import 'package:e_commerce_app/common/widgets/customappbar.dart';
import 'package:e_commerce_app/feautres/personalization/controllers/changeusername_controller.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
   ChangeName({super.key});
final changeNameController = Get.put(UpdateUsernameController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Change Name',
            style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Use real name for easy verification,this name will appear in several pages',
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Form(
              key: changeNameController.updeteUserNameformKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) => TValidator.validateEmptyText(value, 'first name'),
                    controller: changeNameController.firstName,
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.firstName,
                          prefixIcon: Icon(Iconsax.user))),
                 const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),          

  TextFormField(
    validator: (value) => TValidator.validateEmptyText(value, 'last name'),
    controller: changeNameController.lastName,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Iconsax.user))),
            const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: ()=>changeNameController.updateUserName() ,child: const Text('Save')),
                  )
                          
                ],
              ),

                     
        )],
        ),
      ),
    );
  }
}
