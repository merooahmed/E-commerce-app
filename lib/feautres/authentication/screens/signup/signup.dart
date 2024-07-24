import 'package:e_commerce_app/common/widgets/socialmedia_section.dart';
import 'package:e_commerce_app/feautres/authentication/screens/login/widgets/divider_section.dart';
import 'package:e_commerce_app/feautres/authentication/screens/signup/widgets/signup_button.dart';
import 'package:e_commerce_app/feautres/authentication/screens/signup/widgets/singup_form.dart';
import 'package:e_commerce_app/feautres/authentication/screens/signup/widgets/termscheck_section.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TTexts.signupTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
             SingUPForm(),
          
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            const DividerSection(textDivider: TTexts.orSignUpWith),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
           SocialMediaSection(),
          ],
        ),
      ),
    );
  }
}
