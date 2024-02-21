import 'package:e_commerce_app/common/styles/spacingstyls.dart';
import 'package:e_commerce_app/common/widgets/socialmedia_section.dart';
import 'package:e_commerce_app/feautres/authentication/screens/login/widgets/divider_section.dart';
import 'package:e_commerce_app/feautres/authentication/screens/login/widgets/form_section.dart';
import 'package:e_commerce_app/feautres/authentication/screens/login/widgets/header_section.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreeen extends StatelessWidget {
  const LoginScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        
        child: Padding(
          padding: TSpacingStyls.paddingWthAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          
            children: [
             const  HeaderSection(),
               const   FormSection(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
             DividerSection(textDivider: TTexts.orSignInWith.capitalize!,),
               const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
             const  SocialMediaSection(),
             


            ],
          ),
        ),
      ),
    );
  }
}

