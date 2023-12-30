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

  List<UserTicketsModel> ticket = [];
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
    getTicket();
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
        if (response['banner'] != '{"status":"failure"}') {
          banner.addAll(response['banner']);
        } else {
          banner = [];
        }

        if (response['department_story'] != '{"status":"failure"}') {
          departmentStory.addAll(response['department_story']);
        } else {
          departmentStory = [];
        }

        if (response['items'] != '{"status":"failure"}') {
          List item = response['items'];
          items.addAll(item.map((e) => ItemsModel.fromJson(e)));
        } else {
          items = [];
        }

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
    categoriesId = "null";
    super.dispose();
  }

  getTicket() async {
    ticket.clear();
    var response =
        await chatData.getTicketData(id.toString(), categoriesId.toString());
    log("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] != "No Ticket Yet") {
        List massage = response['User_Tickets'];
        ticket.addAll(massage.map((e) => UserTicketsModel.fromJson(e)));
      } else {
        ticket = [];
      }
    }
    if (ticket.isEmpty) {
      ticketId = "null";
    } else {
      ticketId = ticket.last.id ?? "null";
    }

    log("message : ${ticketId}");

    update();
  }
}
