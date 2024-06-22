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
}

class StoriesDepartmentControllerImp extends StoriesDepartmentController {
  MyServices myServices = Get.find();
  DepartmentViewData departmentViewData = DepartmentViewData(Get.find());
  StoryController storyController = StoryController();
  TextEditingController textController = TextEditingController();
  List<HighlightsModel> story = [];
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
  String? slug;

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
    slug = Get.arguments['slug'].toString();

    initialData();
    getData();
    statusRequest = StatusRequest.success;
    super.onInit();
  }

  @override
  getData() async {
    story.clear();
    statusRequest = StatusRequest.loading;
    var response = await departmentViewData.getData(slug!);
    log("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List stores = response['data']['daily_stories'];
      story.addAll(stores.map((e) => HighlightsModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  Future<bool?> addLike(id, index) async {
    // if (!story[index].userId!.contains(userId.toString())) {
    //   var response = await departmentViewData.addLikeStory(id);
    //   log("========================================================================$response");
    //   statusRequest = handlingData(response);
    //   if (StatusRequest.success == statusRequest) {
    //     if (response['status'] == "success") {
    //       story[index].count = (int.parse(story[index].count!) + 1).toString();
    //       story[index].userId = "${userId}";
    //       print(story[index].userId);
    //       update();
    //     }
    //   }
    //   update();
    // }
    return statusRequest == StatusRequest.success ? true : false;
  }

}
