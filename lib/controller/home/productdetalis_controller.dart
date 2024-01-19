import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/controller/items/items_controller.dart';
import 'package:ozcan/core/constant/color.dart';
import 'package:ozcan/data/model/itemsmodel.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/cart/cart_data.dart';
import '../../data/datasource/remote/department_data.dart';

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
  String? categoriesColor;
  late ItemsModel itemsModel;
  CartData cartData = CartData(Get.find());
  DepartmentViewData departmentViewData = DepartmentViewData(Get.find());

  List<ImagesProduct> images = [];

  @override
  initialData() async {
    userId = myServices.sharedPreferences.getString('id');
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
    itemsModel = Get.arguments['itemsModel'];
    categoriesColor = Get.arguments['color'];
    categoriesId = Get.arguments['categoriesId'];
    adminId = Get.arguments['adminId'];
    ticketId = Get.arguments['ticketId'];
    categoriesName = Get.arguments['categoriesName'];
    getData();
    initialData();
    super.onInit();
  }
  Future<bool?> addLike(id) async {
    if (!itemsModel.usersId!.contains(userId.toString())) {
      var response = await departmentViewData.addLike(id);
      log("========================================================================$response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          itemsModel.count = (int.parse(itemsModel.count!) + 1).toString();
          itemsModel.usersId =  "${userId}";
          print(itemsModel.usersId );
          update();
          ItemsControllerImp controllerImp = Get.put(ItemsControllerImp());
          controllerImp.getData();
        }
      }
      update();
    }
    return statusRequest == StatusRequest.success ? true : false;
  }

  @override
  getData() async {
    images.clear();
    statusRequest = StatusRequest.loading;
    update();
    cartData.ViewImage(itemsModel.itemsId).then((value) {
      log("$value");
      statusRequest = handlingData(value);
      if (StatusRequest.success == statusRequest) {
        if (value['status'] == "success") {
          List pending = value['data'];
          images.addAll(pending.map((e) => ImagesProduct.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failure;
        }
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
