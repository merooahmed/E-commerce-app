import 'package:e_commerce_app/feautres/authentication/screens/signup/confirmemail_verification.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUPButton extends StatelessWidget {
  const SignUPButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            Get.to(() => const EmailVerficationScreen());
          },
          child: const Text(TTexts.createAccount)),
    );
  }
}
