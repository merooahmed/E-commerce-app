import 'package:e_commerce_app/common/widgets/circular_image.dart';
import 'package:e_commerce_app/common/widgets/customappbar.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/profile/widgets/tprofilemenu.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/tsectionheader.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Text('Profile'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
         SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const TCircularImage(image: TImages.user,width: 80,height: 80,),
              TextButton(onPressed: (){}, child: const Text('Change profile picture')),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        const Divider(),
        const SizedBox(
                height: TSizes.spaceBtwItems 
              ),
              const TSectionHeader(title: 'Profile Information',showactionbutton: false,),
             const SizedBox(height: TSizes.spaceBtwItems),
             TProfileMenu(title: 'User Id', value: '454689',onpressed: (){},icon: Iconsax.copy,),
              TProfileMenu(
                   title: 'E-mail',
                   value: 'coding_with_t',
                   onpressed: () {},
                 ),
                 TProfileMenu(
                   title: 'Phone number',
                   value: '+92-37-658-2454545',
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
                child: TextButton(child: const Text('Close Account',style: TextStyle(color: Colors.red),),onPressed: (){},),
              )  
          ],
        ),),
      ),
    );
  }
}