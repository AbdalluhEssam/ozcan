import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';import '../../../core/class/statusrequest.dart';
import '../../data/datasource/remote/items_data.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();
  getData(String cateId);
  changeCat(int val,String catVal);
}

class ProductDetailsControllerImp extends ProductDetailsController {
  MyServices myServices = Get.find();
  ItemsData itemsData = ItemsData(Get.find());

  late StatusRequest statusRequest;

  List categories = [];
  List items = [];

  int? selectedCat;
  String? catId;
  String? idUser;
  String? username;

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    catId = Get.arguments['catId'];
    getData(catId!);
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  getData(cateId) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.postData(cateId.toString());
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        items.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  changeCat( val,catVal) {
    selectedCat =val;
    catId =catVal;
    getData(catId!);
    update();
  }
}
