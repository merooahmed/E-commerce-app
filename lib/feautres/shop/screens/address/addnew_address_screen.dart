import 'package:e_commerce_app/common/widgets/customappbar.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(
          'Add New Address',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: 'Phone Number'),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: 'street'),
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwInputFields,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: 'postal Code'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: 'City'),
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwInputFields,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: 'state'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
