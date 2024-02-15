import 'package:e_commerce_app/feautres/authentication/controllers/onboarding_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingElvatedButton extends StatelessWidget {
  const OnBoardingElvatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        right: TSizes.defaultSpace,
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
            backgroundColor: dark ? TColors.primary : TColors.black,
            shape: const CircleBorder(),
          ),
          child: const Icon(Icons.arrow_right_alt_sharp),
        ));
  }
}
