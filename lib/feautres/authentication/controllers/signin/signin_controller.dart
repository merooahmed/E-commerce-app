import 'package:e_commerce_app/data/repositries/authentication_repository.dart';
import 'package:e_commerce_app/feautres/authentication/controllers/signup/network_manger.dart';
import 'package:e_commerce_app/feautres/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();
  final Rx<bool> rememberMe = false.obs;
  final Rx<bool> passwordHidden = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();

  final devicestorage = GetStorage();
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final usercontroller = Get.put(UserController());
  @override
  void onInit() {
    email.text = devicestorage.read('REMEBER_ME_EMAIL') ?? '';
    password.text = devicestorage.read('REMEBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> signIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information......', TImages.docerAnimation);
      final isConnected = await NetworkManger.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!signInFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (rememberMe.value) {
        devicestorage.write('REMEBER_ME_EMAIL', email.text.trim());
        devicestorage.write('REMEBER_ME_PASSWORD', password.text.trim());
      }

      final UserCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim());

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TLoader.errorSnakBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information......', TImages.docerAnimation);
      final isConnected = await NetworkManger.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      final userCredential =
          await AuthenticationRepository.instance.googleSignIn();
      await usercontroller.saveUserRecord(userCredential);
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorSnakBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
