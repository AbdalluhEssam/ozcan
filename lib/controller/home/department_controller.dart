import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/data/datasource/remote/department_data.dart';
import 'package:ozcan/data/model/itemsmodel.dart';
import '../../core/services/services.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import 'home_controller.dart';

abstract class DepartmentController extends SearchMaxController {
  initialData();

  getData();

  goToItems(List categories, int selectedCat, String catId);
}

class DepartmentControllerImp extends DepartmentController {
  MyServices myServices = Get.find();
  DepartmentViewData departmentViewData = DepartmentViewData(Get.find());

  List banner = [];
  List departmentStory = [];
  List story = [];
  List storyTop = [];
  List<ItemsModel> items = [];

  int? currentIndex = 0;

  late StatusRequest statusRequest;

  String? username;
  String? email;
  String? id;
  String? categoriesId;
  String? categoriesName;
  String? categoriesColor;
  String? adminId;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    categoriesId = Get.arguments['categoriesId'].toString();
    categoriesName = Get.arguments['categoriesName'].toString();
    categoriesColor = Get.arguments['categoriesColor'].toString();
    adminId = Get.arguments['adminId'].toString();
    initialData();
    getData();
    getStory();
    super.onInit();
  }

  @override
  getData() async {
    banner.clear();
    statusRequest = StatusRequest.loading;
    var response = await departmentViewData.getData(categoriesId!);
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        banner.addAll(response['banner']);
        if (response['department_story'] != "{\"status\":\"failure\"}") {
          departmentStory.addAll(response['department_story']);
        } else {
          departmentStory = [];
        }
        List item = response['items'];
        items.addAll(item.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getStory() async {
    story.clear();
    statusRequest = StatusRequest.loading;
    var response = await departmentViewData.storyView(categoriesId!);
    log("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['story'] != "{\"status\":\"failure\"}") {
          story.addAll(response['story']);
        } else {
          story = [];
          statusRequest = StatusRequest.success;
        }
      } else {
        story = [];
        statusRequest = StatusRequest.success;
      }
    }
    update();
  }

  @override
  void dispose() {
    items.clear();
    story.clear();
    storyTop.clear();
    super.dispose();
  }

  @override
  goToItems(categories, selectedCat, catId) {
    // Get.toNamed(AppRoute.itemsView,arguments: {
    //   "categories" :  categories ,
    //   "selectedCat" :  selectedCat ,
    //   "catId" :  catId ,
    //
    // });
  }
}
