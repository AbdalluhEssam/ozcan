import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:ozcan/core/services/services.dart';
import 'package:ozcan/data/datasource/remote/auth/login.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  LoginData loginData = LoginData(Get.find());
  late String id;
  String? token;
  late StatusRequest statusRequest;

  @override
  void onInit() {
    token = myServices.sharedPreferences.getString("token");

    super.onInit();
  }

  logout() {
    myServices.sharedPreferences.clear();
    String id = myServices.sharedPreferences.getString("id") ?? "";
    FirebaseMessaging.instance.unsubscribeFromTopic("user$id");
    Get.offAllNamed(AppRoute.login);
  }

  deleteAccount() async {
    myServices.sharedPreferences.clear();
    String id = myServices.sharedPreferences.getString("id") ?? "";
    FirebaseMessaging.instance.unsubscribeFromTopic("user$id");
    statusRequest = StatusRequest.loading;
    var response = await loginData.deleteAccount(token.toString());
    log("========================================================================$response");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      myServices.sharedPreferences.clear();
      String id = myServices.sharedPreferences.getString("id") ?? "";
      FirebaseMessaging.instance.unsubscribeFromTopic("user$id");
      Get.offAllNamed(AppRoute.login);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}
