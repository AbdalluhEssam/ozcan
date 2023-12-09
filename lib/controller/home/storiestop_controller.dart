import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/data/datasource/remote/department_data.dart';
import 'package:story_view/controller/story_controller.dart';
import '../../core/services/services.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import 'home_controller.dart';

abstract class StoriesTopController extends SearchMaxController {
  initialData();

  getData();

  goToItems(List categories, int selectedCat, String catId);
}

class StoriesTopControllerImp extends StoriesTopController {
  MyServices myServices = Get.find();
  DepartmentViewData departmentViewData = DepartmentViewData(Get.find());
  StoryController storyController = StoryController();
  TextEditingController textController = TextEditingController();
  List story = [];

  int? currentIndex = 0;

  late StatusRequest statusRequest;

  String? username;
  String? email;
  String? id;
  String? categoriesId;
  String? adminId;
  String? departmentId;
  String? categoriesColor;
  String? itemsName;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    categoriesId = Get.arguments['categoriesId'].toString();
    categoriesColor = Get.arguments['categoriesColor'].toString();
    departmentId = Get.arguments['departmentId'].toString();
    adminId = Get.arguments['adminId'].toString();
    getData();
    statusRequest = StatusRequest.success;
    super.onInit();
  }

  @override
  getData() async {
    story.clear();
    statusRequest = StatusRequest.loading;
    var response = await departmentViewData.storyTop(departmentId!);
    log("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        story.addAll(response['story']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  addLikes() async {
    story.clear();
    statusRequest = StatusRequest.loading;
    var response = await departmentViewData.addLikes(currentIndex.toString());
    log("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        update();
      }
    }
    update();
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
