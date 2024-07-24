import 'package:e_commerce_app/data/repositries/authentication_repository.dart';
import 'package:e_commerce_app/feautres/authentication/controllers/signup/network_manger.dart';
import 'package:e_commerce_app/feautres/authentication/screens/passwordverification/reset_password.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();
  final emailConrtoller = TextEditingController();
  GlobalKey<FormState> forgetPasswordformKey = GlobalKey<FormState>();
  sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information......', TImages.docerAnimation);
      final isConnected = await NetworkManger.instance.isConnected();
      if (!isConnected) {
        return;
      }
      if (!forgetPasswordformKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(emailConrtoller.text.trim());
      TFullScreenLoader.stopLoading();
      TLoader.successSnakBar(
        title: 'Email sent',
        message: 'Please check your inbox  for email verification',
      );
      Get.to(() => ResetPassword(email: emailConrtoller.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorSnakBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
     try {
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information......', TImages.docerAnimation);
      final isConnected = await NetworkManger.instance.isConnected();
      if (!isConnected) {
        return;
      }
    
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);
      TFullScreenLoader.stopLoading();
      TLoader.successSnakBar(
        title: 'Email sent',
        message: 'Please check your inbox  for email verification',
      );
    
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorSnakBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
