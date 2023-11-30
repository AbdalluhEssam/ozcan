import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/favorite_data.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  List items = [];

  Map isFavorite = {};

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemId) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(itemId.toString());
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // items.addAll(response['data']);
        Get.rawSnackbar(
            title: "notice".tr,
            messageText: Text("add".tr),
            backgroundColor: AppColor.primaryColor,
            duration: const Duration(seconds: 1));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  deleteFavorite(String itemId) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.deleteFavorite(itemId.toString());
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "notice".tr,
            messageText: Text("del".tr),
            backgroundColor: AppColor.primaryColor,
            duration: const Duration(seconds: 1));

        // items.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
