import 'package:e_commerce_app/feautres/authentication/screens/onboarding/on_boarding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const intialroute = '/';
  static final routes = [
    GetPage(name: AppRoutes.intialroute, page: () =>  OnBoardingPage()),
  ];
}
