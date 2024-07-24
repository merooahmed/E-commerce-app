import 'package:e_commerce_app/feautres/authentication/controllers/signup/network_manger.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
Get.put(NetworkManger());
  }
}