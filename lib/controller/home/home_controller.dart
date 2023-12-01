import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/services/services.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/homedata.dart';
import '../../data/model/itemsmodel.dart';

abstract class HomeController extends SearchMaxController {
  initialData();
  getData();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  List categories = [];
  List images = [];
  List itemsTopSelling = [];
  List banner = [];
  int? currentIndex;

  @override
  HomeData homeData = HomeData(Get.find());

  String? username;
  String? email;
  String? id;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        images.addAll(response['home']);
        categories.addAll(response['categories']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}

class SearchMaxController extends GetxController {
  List<ItemsModel> listDataControl = [];
  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;
  TextEditingController? search;

  bool isSearch = false;

  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    listDataControl.clear();
    statusRequest = StatusRequest.loading;
    var response = await homeData.search(search!.text);
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List res = response['data'];
        listDataControl.addAll(res.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();

    super.onInit();
  }
}
