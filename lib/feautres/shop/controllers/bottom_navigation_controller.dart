import 'package:e_commerce_app/feautres/shop/screens/home.dart';
import 'package:e_commerce_app/feautres/shop/screens/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomeScreen(),
   StoreScreen(),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.yellow,
    )
  ];
}
