import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/data/datasource/remote/department_data.dart';
import 'package:story_view/controller/story_controller.dart';
import '../../core/services/services.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/model/story.dart';
import 'home_controller.dart';

abstract class StoriesDepartmentController extends SearchMaxController {
  initialData();

  getData();

  goToItems(List categories, int selectedCat, String catId);
}

class StoriesDepartmentControllerImp extends StoriesDepartmentController {
  MyServices myServices = Get.find();
  DepartmentViewData departmentViewData = DepartmentViewData(Get.find());
  StoryController storyController = StoryController();
  TextEditingController textController = TextEditingController();
  List<StoryModel> story = [];

  int? currentIndex = 0;

  late StatusRequest statusRequest;

  String? username;
  String? email;
  String? userId;
  String? categoriesId;
  String? adminId;
  String? ticketId;
  String? categoriesColor;
  String? itemsName;
  String? image;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    userId = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    categoriesId = Get.arguments['categoriesId'];
    categoriesColor = Get.arguments['categoriesColor'];
    adminId = Get.arguments['adminId'];
    ticketId = Get.arguments['ticketId'];
    initialData();
    getData();
    statusRequest = StatusRequest.success;
    super.onInit();
  }

  @override
  getData() async {
    story.clear();
    statusRequest = StatusRequest.loading;
    var response = await departmentViewData.storyView(categoriesId!);
    log("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List stores = response['story'];
        story.addAll(stores.map((e) => StoryModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<bool?> addLike(id, index) async {
    if (!story[index].userId!.contains(userId.toString())) {
      var response = await departmentViewData.addLikeStory(id);
      log("========================================================================$response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          story[index].count = (int.parse(story[index].count!) + 1).toString();
          story[index].userId = "${userId}";
          print(story[index].userId);
          update();
        }
      }
      update();
    }
    return statusRequest == StatusRequest.success ? true : false;
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
