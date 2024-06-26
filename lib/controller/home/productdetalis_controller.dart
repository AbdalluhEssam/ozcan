import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/core/constant/color.dart';
import 'package:ozcan/data/model/itemsmodel.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/cart/cart_data.dart';
import '../../data/datasource/remote/department_data.dart';
import '../items/items_controller.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();

  getData();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  late String? username;
  late String? email;
  late String? categoriesId;
  late String? adminId;
  late String? categoriesName;
  late String? ticketId;
  late String? userId;
  late String? slug;
  late String? token;
  String? categoriesColor;
  late ItemsDetailsModel itemsModel;
  CartData cartData = CartData(Get.find());
  DepartmentViewData departmentViewData = DepartmentViewData(Get.find());

  List<int> likes = [];

  @override
  initialData() async {
    userId = myServices.sharedPreferences.getString('id');
    token = myServices.sharedPreferences.getString('token');
  }

  RegExp urlRegExp = RegExp(
    r"http(s)?://([\w-]+\.)+[\w-]+(/[\w- ;,./?%&=]*)?",
    caseSensitive: false,
  );

  bool containsLink(String text) {
    return urlRegExp.hasMatch(text);
  }

  List subItems = [
    {"name": "RED", "id": 1, "active": '0'},
    {"name": "Yellow", "id": 2, "active": '0'},
    {"name": "Black", "id": 3, "active": '1'},
  ];

  @override
  void onInit() {
    initialData();
    itemsModel = ItemsDetailsModel();
    slug = Get.arguments['slug'];
    if(Get.arguments['color'] != null){
      categoriesColor = Get.arguments['color'];
      categoriesId = Get.arguments['categoriesId'];
      categoriesName = Get.arguments['categoriesName'];
    }

    getData();
    super.onInit();
  }

  Future<bool?> addLike(id) async {
    if (!itemsModel.likes!.contains(userId.toString())) {
      var response = await departmentViewData.addLike(id.toString(), token);
      log("========================================================================$response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        getData();
        ItemsControllerImp controllerImp = Get.put(ItemsControllerImp());
        controllerImp.getData();
        update();
      }
      update();
    }
    return statusRequest == StatusRequest.success ? true : false;
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = ItemsDetailsModel();
    update();
    departmentViewData.getItemsDetailsData(slug!).then((value) {
      log("$value");
      statusRequest = handlingData(value);
      if (StatusRequest.success == statusRequest) {
        itemsModel = ItemsDetailsModel.fromJson(value['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }

      update();
    });
    update();
  }

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
            duration: const Duration(seconds: 1));
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
