import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ozcan/data/datasource/remote/department_data.dart';
import 'package:ozcan/data/model/itemsmodel.dart';
import '../../core/services/services.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/chat_data.dart';
import '../../data/model/massage_model.dart';
import 'home_controller.dart';

abstract class DepartmentController extends SearchMaxController {
  initialData();

  getData();
}

class DepartmentControllerImp extends DepartmentController {
  MyServices myServices = Get.find();
  DepartmentViewData departmentViewData = DepartmentViewData(Get.find());
  ChatData chatData = ChatData(Get.find());

  late UserTicketsModel ticket ;
  List banner = [];
  List departmentStory = [];
  List story = [];
  List storyTop = [];
  List<ItemsModel> items = [];
  RegExp urlRegExp = RegExp(
    r"http(s)?://([\w-]+\.)+[\w-]+(/[\w- ;,./?%&=]*)?",
    caseSensitive: false,
  );

  bool containsLink(String text) {
    return urlRegExp.hasMatch(text);
  }

  int? currentIndex = 0;

  late StatusRequest statusRequest;

  String? username;
  String? email;
  String? id;
  String? categoriesId;
  String? categoriesName;
  String? categoriesColor;
  String? adminId;
  String? ticketId;
  String? slug;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    // ticket =UserTicketsModel();
    initialData();
    categoriesId = Get.arguments['categoriesId'].toString();
    categoriesName = Get.arguments['categoriesName'].toString();
    categoriesColor = Get.arguments['categoriesColor'].toString();
    slug = Get.arguments['slug'].toString();
    getData();
    // getStory();
    super.onInit();
  }

  @override
  getData() async {
    banner.clear();
    statusRequest = StatusRequest.loading;
    var response = await departmentViewData.getData(slug!);
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {

        banner.addAll(response['data']['banners']);
        story.addAll(response['data']['daily_stories']);
        storyTop.addAll(response['data']['highlights']);
          List item = response['data']['products'];
          items.addAll(item.map((e) => ItemsModel.fromJson(e)));

        // if (response['banner'] != '{"status":"failure"}') {
        //   banner.addAll(response['banner']);
        // } else {
        //   banner = [];
        // }

        // if (response['department_story'] != '{"status":"failure"}') {
        //   departmentStory.addAll(response['department_story']);
        // } else {
        //   departmentStory = [];
        // }

        // if (response['items'] != '{"status":"failure"}') {
        //   List item = response['items'];
        //   items.addAll(item.map((e) => ItemsModel.fromJson(e)));
        // } else {
        //   items = [];
        // }


    }else {
      statusRequest = StatusRequest.failure;
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
    categoriesId = "null";
    super.dispose();
  }


}
