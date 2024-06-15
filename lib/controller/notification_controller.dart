// ignore_for_file: avoid_print, unused_local_variable
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/homedata.dart';
import '../../data/model/notification_model.dart';

abstract class NotificationController extends GetxController {
  initialData();

  getData();
}

class NotificationControllerImp extends NotificationController {
  MyServices myServices = Get.find();

  HomeData homeData = HomeData(Get.find());

  List<NotificationModel> notification = [];

  late StatusRequest statusRequest;

  String? username;
  String? email;
  String? id;
  String? categoriesId;
  String? categoriesName;
  String? adminId;
  String? categoriesColor;
  String? token;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
    token = myServices.sharedPreferences.getString("token");
  }

  @override
  void onInit() {
    categoriesId = Get.arguments['categoriesId'];
    categoriesName = Get.arguments['categoriesName'];
    categoriesColor = Get.arguments['color'];
    adminId = Get.arguments['adminId'];
    initialData();
    getData();
    super.onInit();
  }

  openWeb(String url) async {
    await launchUrlString(url);
    update();
  }

  @override
  getData() {
    notification.clear();
    statusRequest = StatusRequest.loading;
    update();
    homeData.getNotificationData(token.toString()).then((value) {
      log("========================================================================$value");
      statusRequest = handlingData(value);
      if (StatusRequest.success == statusRequest) {
        List notifications = value['notification'];
        notification
            .addAll(notifications.map((e) => NotificationModel.fromJson(e)));
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }).catchError((onError) {
      log("Error=== : ===$onError");
      update();
    });

    update();
  }
}
