import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/core/constant/color.dart';
import 'package:ozcan/data/model/itemsmodel.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/cart/cart_data.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();

  getData();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  late String? username;
  late String? email;
  String? categoriesColor;
  late ItemsModel itemsModel;
  CartData cartData = CartData(Get.find());


  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsModel'];
    statusRequest = StatusRequest.success;
    update();
  }

  List subItems = [
    {"name": "RED", "id": 1, "active": '0'},
    {"name": "Yellow", "id": 2, "active": '0'},
    {"name": "Black", "id": 3, "active": '1'},
  ];

  @override
  void onInit() {
    categoriesColor = Get.arguments['color'];
    initialData();
    super.onInit();
  }

  @override
  getData() async {}

  addItems(String itemId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.addCart(itemId.toString());
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "notice".tr,
            messageText: Text("addCart".tr),
            backgroundColor: AppColor.primaryColor,
            duration: const Duration(seconds: 1)
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  delete(String itemId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.deleteCart(itemId.toString());
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "notice".tr,
            messageText: Text("delCart".tr),
            backgroundColor: AppColor.primaryColor,
            duration: const Duration(seconds: 1));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCountItems(String itemId) async {
    statusRequest = StatusRequest.loading;

    var response = await cartData.getCountCart(itemId.toString());
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int count = 0;
        count = int.parse(response['data']);
        if (kDebugMode) {
          print(
              "////////////////////////////////////////$count/////////////////");
        }
        return count;
        // items.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
