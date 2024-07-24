import 'package:e_commerce_app/data/repositries/authentication_repository.dart';
import 'package:e_commerce_app/data/repositries/user/user_model.dart';
import 'package:e_commerce_app/data/repositries/user/user_repository.dart';
import 'package:e_commerce_app/feautres/authentication/controllers/signup/network_manger.dart';
import 'package:e_commerce_app/feautres/authentication/controllers/signup/verfiy_email_controller.dart';
import 'package:e_commerce_app/feautres/authentication/screens/login/login.dart';
import 'package:e_commerce_app/feautres/authentication/screens/re_authentication/re_authentication_screen.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepo = Get.put(UserRepository());
  final profileLoading = false.obs;
  final imageUploading = false.obs;
  final verfiyEmail = TextEditingController();
  final verfiyPassword = TextEditingController();
  Rx<UserModel> user = UserModel.empty().obs;
  final hiddingPassword = false.obs;
  GlobalKey<FormState> reauthKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    try {
      profileLoading(true);
      final user = await userRepo.fetchUserDetails();

      this.user(user);
      profileLoading(false);
    } catch (e) {
      user(UserModel.empty());
      profileLoading(false);
    } finally {
      profileLoading(false);
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserDetails();
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final nameparts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final userName = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');
          final user = UserModel(
              id: userCredential.user!.uid,
              firstName: nameparts[0],
              lastName:
                  nameparts.length > 1 ? nameparts.sublist(1).join('') : '',
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePicture: userCredential.user!.photoURL ?? '',
              userName: userName);
          await userRepo.saveUserRecord(user);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      TLoader.warningSnakBar(title: 'Data notttt saved', message: e.toString());
    }
  }

  void deleteAccountPopUP() {
    Get.defaultDialog(
        title: 'Delete Account',
        contentPadding: const EdgeInsets.all(TSizes.md),
        middleText:
            'Are you sure you want to delete your account permenantly ? this action is not reversable nd ur data will be permanently deleted',
        confirm: ElevatedButton(
          onPressed: () async => deleteAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Text('Delete'),
          ),
        ),
        cancel: ElevatedButton(
          onPressed: () async => Navigator.of(Get.context!).pop(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Text('Cancel'),
          ),
        ));
  }

  void deleteAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('processing', TImages.docerAnimation);
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData
          .map((e) => e.providerId)
          .first; ////////////////??????
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.googleSignIn();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreeen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => ReauthenticationScreen());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorSnakBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> reauthEmailAnPassword() async {
    try {
      TFullScreenLoader.openLoadingDialog('processing', TImages.docerAnimation);
      final isConnected = await NetworkManger.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reauthKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .reauthenticateWithEmailandPassword(
              verfiyEmail.text.trim(), verfiyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreeen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.errorSnakBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> uploadUserProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      print('hello image ');
      if (image != null) {
        imageUploading.value = true;
        final imageUrl =
            await userRepo.uploadImage('Users/Images/Profile/', image);
        print('you in firebase storage');
        Map<String, dynamic> json = {'profilePicture': imageUrl};
        await userRepo.updateSingleField(json);
        user.value.profilePicture = imageUrl;

        TLoader.successSnakBar(
            title: 'conguratulations',
            message: 'ur profile picture has been updated');
      }
    } catch (e) {
      print(e.toString());
      TLoader.errorSnakBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}
