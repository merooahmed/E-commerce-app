import 'package:e_commerce_app/data/repositries/user/user_repository.dart';
import 'package:e_commerce_app/feautres/authentication/controllers/signup/network_manger.dart';
import 'package:e_commerce_app/feautres/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/feautres/shop/screens/setting.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/profile/screens/user_profile_screen.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateUsernameController extends GetxController {
  static UpdateUsernameController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  GlobalKey<FormState> updeteUserNameformKey = GlobalKey<FormState>();
  final userRepo = Get.put(UserRepository());
  @override
  void onInit() {
    intilizeNames();
    super.onInit();
  }

  Future<void> intilizeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information......', TImages.docerAnimation);
      final isConnected = await NetworkManger.instance.isConnected();
      if (!isConnected) {
        return;
      }
      if (!updeteUserNameformKey.currentState!.validate()) {
        return;
      }
      Map<String, dynamic> names = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim(),
      };

      await userRepo.updateSingleField(names);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      TFullScreenLoader.stopLoading();
      TLoader.successSnakBar(
          title: 'congratulations', message: 'ur name has been updated');
      Get.off(() => UserProfileInfo());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorSnakBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
