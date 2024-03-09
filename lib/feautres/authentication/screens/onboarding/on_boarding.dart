import 'package:e_commerce_app/feautres/authentication/controllers/onboarding_controller.dart';
import 'package:e_commerce_app/feautres/authentication/screens/onboarding/widgets/onboarding_elvatedbutton.dart';
import 'package:e_commerce_app/feautres/authentication/screens/onboarding/widgets/onboarding_skip_button.dart';
import 'package:e_commerce_app/feautres/authentication/screens/onboarding/widgets/onboarding_view.dart';
import 'package:e_commerce_app/feautres/authentication/screens/onboarding/widgets/onboardingdots_navigation.dart';

import 'package:e_commerce_app/utils/constants/image_strings.dart';

import 'package:e_commerce_app/utils/constants/text_strings.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnBoardingPage extends StatelessWidget {
   OnBoardingPage({super.key});
  final OnBoardingController controller = Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged:controller.updatePageIndex,
            children: const [
            OnBoardingView(
              image: TImages.onBoardingImage1,
              title: TTexts.onBoardingTitle1,
              subtitle: TTexts.onBoardingSubTitle1,
            ),
            OnBoardingView(
              image: TImages.onBoardingImage2,
              title: TTexts.onBoardingTitle2,
              subtitle: TTexts.onBoardingSubTitle2,
            ),
            OnBoardingView(
              image: TImages.onBoardingImage3,
              title: TTexts.onBoardingTitle3,
              subtitle: TTexts.onBoardingSubTitle3,
            ),
          ]),
          const OnBoardingSkipButton(),
          const OnBoardingDotsNavigation(),
          const OnBoardingElvatedButton(),
        ],
      ),
    );
  }
}
