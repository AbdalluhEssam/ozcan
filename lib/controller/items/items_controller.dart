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

  // void scrollToIndex(int index) {
  //   double position = index * 60.0; // Adjust item height based on your design
  //
  //   scrollController.addListener(() {
  //     scrollController.animateTo(
  //       position,
  //       duration: Duration(seconds: 1),
  //       curve: Curves.easeInOut,
  //     );
  //   });
  // }

  late StatusRequest statusRequest;

  String? username;
  String? email;
  String? userId;
  String? categoriesId;
  String? categoriesName;
  String? categoriesColor;
  String? adminId;
  int? itemId;
  var index = 0.obs;
  String? ticketId;
  String? slug;
  String? token;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    userId = myServices.sharedPreferences.getString("id");
    token = myServices.sharedPreferences.getString('token');
  }

  void scrollToIndex() {
    int? indexValue = index.value; // Get the current index value
    if (indexValue != null && scrollController.hasClients) {
      // Calculate the offset based on item height
      double offset = indexValue * (Get.width * 0.97); // Adjust this as per your item height
      scrollController.animateTo(
        offset,
        duration: Duration(milliseconds: 400),
        curve: Curves.linear,
      );
    }
  }

  @override
  void onInit() {
    slug = Get.arguments['slug'].toString();
    categoriesId = Get.arguments['categoriesId'].toString();
    categoriesName = Get.arguments['categoriesName'].toString();
    categoriesColor = Get.arguments['categoriesColor'].toString();
    index.value = Get.arguments['index'];
    itemId = Get.arguments['itemId'];
    log(itemId.toString());
    log((Get.width * 0.978).toString());
    initialData();
    getData();



    super.onInit();
  }

  @override
  getData() async {
    items.clear();
    statusRequest = StatusRequest.loading;
    var response = await departmentViewData.getItemsData(slug!);
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List item = response['data'];
      items.addAll(item.map((e) => ItemsModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }
    if (items.isNotEmpty) {
      Timer(Duration(milliseconds: 300), () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // Scroll to the end of the list
          if (scrollController.hasClients) {
            scrollController.addListener(() {
              scrollToIndex();
              update();
              print(["log", scrollController.offset]);
            });
          }
          scrollController.notifyListeners();
          scrollController.keepScrollOffset;
          scrollController.dispose();
        });

        update();
      });
    }
    update();
  }

  Future<bool?> addLike(id, index) async {
    if (!items[index].likes.toString().contains(userId.toString())) {
      var response = await departmentViewData.addLike(id.toString(),token);
      log("========================================================================$response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
      getData();
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
