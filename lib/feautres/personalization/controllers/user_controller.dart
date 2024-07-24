import 'package:e_commerce_app/data/repositries/user/user_model.dart';
import 'package:e_commerce_app/data/repositries/user/user_repository.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepo = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    try {
      final user = await userRepo.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final nameparts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final userName =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');
        final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameparts[0],
            lastName: nameparts.length > 1 ? nameparts.sublist(1).join('') : '',
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
            userName: userName);
        await userRepo.saveUserRecord(user);
      }
    } catch (e) {
      debugPrint(e.toString());
      TLoader.warningSnakBar(title: 'Data notttt saved', message: e.toString());
    }
  }
}
