import 'package:e_commerce_app/feautres/authentication/screens/login/login.dart';
import 'package:e_commerce_app/feautres/authentication/screens/onboarding/on_boarding.dart';
import 'package:e_commerce_app/feautres/authentication/screens/signup/confirmemail_verification.dart';
import 'package:e_commerce_app/feautres/shop/screens/widgets/navigation_menu.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final devicestorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get authUser=>_auth.currentUser;
  @override
  void onReady() {
    FlutterNativeSplash.remove();

    screenRedirect();
  }

  void screenRedirect() {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => BottomNavigationMenu());
      } else {
        Get.offAll(() => const EmailVerficationScreen());
      }
    } else {
      devicestorage.writeIfNull('isFirstTime', true);
      devicestorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreeen())
          : Get.offAll(() => OnBoardingPage());
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    debugPrint("Email done");
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      debugPrint("FirebaseAuthException${e.code}");
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      debugPrint("FirebaseException${e.code}");

      throw TFirebaseException(e.code).message;
    } on FormatException catch (e) {
      debugPrint("FormatException$e");

      throw const TFormatException();
    } on PlatformException catch (e) {
      debugPrint("PlatformException${e.code}");

      throw TPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());

      throw 'Something went wrong!,plese try again';
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong!,plese try again';
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong!,plese try again';
    }
  }

  Future<void> logOut() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
      Get.offAll(() => const LoginScreeen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong!,plese try again';
    }
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      debugPrint("FirebaseAuthException${e.code}");
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      debugPrint("FirebaseException${e.code}");

      throw TFirebaseException(e.code).message;
    } on FormatException catch (e) {
      debugPrint("FormatException$e");

      throw const TFormatException();
    } on PlatformException catch (e) {
      debugPrint("PlatformException${e.code}");

      throw TPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());

      throw 'Something went wrong!,plese try again';
    }
  }

  Future<UserCredential> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong!,plese try again';
    }
  }
}
