import 'package:e_commerce_app/feautres/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUPButton extends StatelessWidget {
   SignUPButton({
    super.key,
  });
final controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () async => controller.signUp()
          ,
          child: const Text(TTexts.createAccount)),
    );
  }
}
