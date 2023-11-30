import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:ozcan/core/services/services.dart';

import '../../core/constant/routes.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  late String id;

  @override
  void onInit() {
    super.onInit();
  }

  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
