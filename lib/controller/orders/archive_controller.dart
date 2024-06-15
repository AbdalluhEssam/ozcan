import 'dart:developer';
import 'package:get/get.dart';
import 'package:ozcan/core/class/statusrequest.dart';
import 'package:ozcan/core/functions/handlingdatacontroller.dart';
import 'package:ozcan/core/services/services.dart';
import 'package:ozcan/data/datasource/remote/orders/pending_data.dart';
import 'package:ozcan/data/model/orders_model.dart';

class OrdersAllController extends GetxController {
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  List<OrdersModel> pendingOrders = [];
  OrdersData pendingData = OrdersData(Get.find());
  String? categoriesId;
  String? categoriesColor;
  String? token;
  RegExp urlRegExp = RegExp(
    r"http(s)?://([\w-]+\.)+[\w-]+(/[\w- ;,./?%&=]*)?",
    caseSensitive: false,
  );

  bool containsLink(String text) {
    return urlRegExp.hasMatch(text);
  }

  @override
  void onInit() {
    // categoriesId = Get.arguments['categoriesId'].toString();
    // categoriesColor = Get.arguments['categoriesColor'];
    token = myServices.sharedPreferences.getString("token");

    getData();
    super.onInit();
  }

  getData() async {
    pendingOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    pendingData.archiveOrders(token).then((value) {
      log("$value");
      statusRequest = handlingData(value);
      if (StatusRequest.success == statusRequest) {
        List pending = value['data'];
        pendingOrders.addAll(pending.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }

      update();
    });
    update();
  }

  refreshOrder() {
    getData();
    update();
  }
}
