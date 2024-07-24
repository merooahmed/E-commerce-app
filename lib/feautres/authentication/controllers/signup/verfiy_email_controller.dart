import 'dart:async';

import 'package:e_commerce_app/common/widgets/success_screen.dart';
import 'package:e_commerce_app/data/repositries/authentication_repository.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class VerfiyEmailController extends GetxController {
  static VerfiyEmailController get instance => Get.find();
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoader.successSnakBar(
        title: 'Email sent',
        message: 'Please check your inbox  for email verification',
      );
    } catch (e) {
      TLoader.errorSnakBar(title: 'Oh Snap', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
     await   Get.to(() => SuccessScreen(
            headline: TTexts.yourAccountCreatedTitle,
            titleBody: TTexts.yourAccountCreatedSubTitle,
            image: TImages.succesfullyRegisterAnimation,
            onpressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  checkEmailVerficationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          headline: TTexts.yourAccountCreatedTitle,
          titleBody: TTexts.yourAccountCreatedSubTitle,
          image: TImages.succesfullyRegisterAnimation,
          onpressed: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
