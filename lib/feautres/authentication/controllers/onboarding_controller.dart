

import 'package:e_commerce_app/feautres/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  Rx<int> currentpageIndex = 0.obs;
  final pageController = PageController();
  void updatePageIndex(index) => currentpageIndex.value = index;

  void dotNavigationClickIndex(index) {
    currentpageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage() {
    if (currentpageIndex.value == 2) {
      Get.offAll(LoginScreeen());
    } else {
      int pageIndex = currentpageIndex.value + 1;
      pageController.jumpToPage(pageIndex);
    }
  }

  void skipPage() {
    currentpageIndex.value == 2;
    pageController.jumpToPage(2);
  }
}
