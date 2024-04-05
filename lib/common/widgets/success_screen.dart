import 'package:e_commerce_app/common/styles/spacingstyls.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.headline,
      required this.titleBody,
      required this.image,
      required this.onpressed});
  final String headline, titleBody, image;
  final void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyls.paddingWthAppBarHeight * 3,
          child: Column(children: [
            Image(
              image:  AssetImage(
                image
              ),
              width: TDeviceUtils.getScreenWidth(context) * 0.6,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections / 2,
            ),
            Text(
              headline,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              titleBody,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: onpressed, child: const Text(TTexts.tContinue)),
            ),
          ]),
        ),
      ),
    );
  }
}
