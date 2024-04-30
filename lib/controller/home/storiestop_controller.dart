import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/data/datasource/remote/department_data.dart';
import 'package:ozcan/data/model/story.dart';
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
  List<HighlightsModel> story = [];

  int? currentIndex = 0;

  late StatusRequest statusRequest;

  String? username;
  String? email;
  String? id;
  String? categoriesId;
  String? highlightsId;
  String? adminId;
  String? ticketId;
  String? departmentId;
  String? categoriesColor;
  String? itemsName;
  String? image;
  String? slug;

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
    highlightsId = Get.arguments['highlightsId'].toString();
    slug = Get.arguments['slug'].toString();
    getData();
    super.onInit();
  }

  @override
  getData() async {
    story.clear();
    statusRequest = StatusRequest.loading;
    var response = await departmentViewData.storyView(highlightsId!);
    log("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List stores = response['data'];
      story.addAll(stores.map((e) => HighlightsModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  // addLikes() async {
  //   story.clear();
  //   statusRequest = StatusRequest.loading;
  //   var response = await departmentViewData.addLike(currentIndex.toString());
  //   log("========================================================================$response");
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       update();
  //     }
  //   }
  //   update();
  // }

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
