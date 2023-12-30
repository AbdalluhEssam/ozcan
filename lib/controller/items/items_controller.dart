import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/data/datasource/remote/department_data.dart';
import 'package:ozcan/data/model/itemsmodel.dart';
import '../../core/services/services.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../home/home_controller.dart';

abstract class ItemsController extends SearchMaxController {
  initialData();

  getData();

  goToItems(List categories, int selectedCat, String catId);
}

class ItemsControllerImp extends ItemsController {
  MyServices myServices = Get.find();
  DepartmentViewData departmentViewData = DepartmentViewData(Get.find());

  List<ItemsModel> items = [];

  int? currentIndex = 0;
  ScrollController scrollController = ScrollController();
  RxInt selectedIndex = 0.obs;
  RegExp urlRegExp = RegExp(
    r"http(s)?://([\w-]+\.)+[\w-]+(/[\w- ;,./?%&=]*)?",
    caseSensitive: false,
  );
  bool containsLink(String text) {
    return urlRegExp.hasMatch(text);
  }
  late StatusRequest statusRequest;

  String? username;
  String? email;
  String? id;
  String? categoriesId;
  String? categoriesName;
  String? categoriesColor;
  String? adminId;
  int? itemId;
  String? ticketId;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
  }

  // ScrollPosition currentScrollPosition = scrollController.position;
  // double currentOffset = scrollController.offset;

  scrollToIndex() {
    if (itemId != null) {
      // Your logic to determine the index based on itemId
      int index = itemId ?? 0;

      // Scroll to the calculated offset
      double offset =
          index * Get.height * 0.68; // Replace 100.0 with your item height
      scrollController.jumpTo(offset);
      scrollController.animateTo(
        offset,
        duration: Duration(milliseconds: 400),
        curve: Curves.linear,
      );
    }
    // double offset = index * Get.height * 0.45; // Replace 100.0 with your item height
    // scrollController.jumpTo(offset);
  }

  @override
  void onInit() {
    categoriesId = Get.arguments['categoriesId'].toString();
    categoriesName = Get.arguments['categoriesName'].toString();
    categoriesColor = Get.arguments['categoriesColor'].toString();
    adminId = Get.arguments['adminId'].toString();
    itemId = Get.arguments['itemId'];
    ticketId = Get.arguments['ticketId'];
    log(itemId.toString());
    initialData();
    getData();
    Timer(Duration(milliseconds: 500), () {
      scrollController.addListener(() {
        scrollToIndex();
        print(["log", scrollController.offset]);
      });
      scrollController.notifyListeners();
      scrollController.keepScrollOffset;
      scrollController.dispose();
    });
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await departmentViewData.getData(categoriesId!);
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List item = response['items'];
        items.addAll(item.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
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
