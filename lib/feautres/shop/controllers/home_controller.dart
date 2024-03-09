import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rx<int> carouselCurrentIndex = 0.obs;
  static HomeController get instance => Get.find();
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }
}
