import 'package:e_commerce_app/data/repositries/authentication_repository.dart';
import 'package:e_commerce_app/data/repositries/user/user_model.dart';
import 'package:e_commerce_app/data/repositries/user/user_repository.dart';
import 'package:e_commerce_app/feautres/authentication/controllers/signup/network_manger.dart';
import 'package:e_commerce_app/feautres/authentication/screens/signup/confirmemail_verification.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final Rx<bool> privacyPolicy = false.obs;
  final Rx<bool> passwordHidden = true.obs;
  final emailController = TextEditingController();
  final passwordcontroller = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final userNameController = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  get phoneController => null;
  Future<void> signUp() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information......', TImages.docerAnimation);
      final isConnected = await NetworkManger.instance.isConnected();
      if (!isConnected) {
        return;
      }
      if (!signUpFormKey.currentState!.validate()) {
        return;
      }
      if (!privacyPolicy.value) {
        TLoader.warningSnakBar(
            title: 'Accept privacy Policy',
            message:
                'In order to create account ,you must have accepted our privacy policy & terms of use');
        return;
      }

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              emailController.text.trim(), passwordcontroller.text.trim());

      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstNameController.text.trim(),
          email: emailController.text.trim(),
          lastName: lastNameController.text.trim(),
          profilePicture: '',
          phoneNumber: phoneNumberController.text.trim(),
          userName: userNameController.text.trim());

      final userRepo = Get.put(UserRepository());
      await userRepo.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();

      TLoader.successSnakBar(
          title: 'congratulations',
          message: 'Account created successfully,verify Email to continue');
     
      debugPrint('  Email done');
     await  Get.to(() => EmailVerficationScreen(
            email: emailController.text.trim(),
          ));
      debugPrint(' Now in verfication screen');
    } catch (e) {
      TLoader.errorSnakBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
