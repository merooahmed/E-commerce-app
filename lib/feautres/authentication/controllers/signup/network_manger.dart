import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManger extends GetxController {
  static NetworkManger get instance=> Get.find();
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectivityStatus =
      ConnectivityResult.none.obs;
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectivityStatus.value = result.first;
    if (_connectivityStatus.value == ConnectivityResult.none) {
      TLoader.warningSnakBar(title: 'No Internet Connection');
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (e) {
      return false;
    }
  }
@override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
