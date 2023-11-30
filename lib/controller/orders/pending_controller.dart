import 'dart:developer';

import 'package:get/get.dart';
import 'package:ozcan/core/class/statusrequest.dart';
import 'package:ozcan/core/functions/handlingdatacontroller.dart';
import 'package:ozcan/core/services/services.dart';
import 'package:ozcan/data/datasource/remote/orders/pending_data.dart';
import 'package:ozcan/data/model/orders_model.dart';

class OrdersPendingController extends GetxController {
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  List<OrdersModel> pendingOrders = [];
  OrdersData pendingData = OrdersData(Get.find());

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Await Approval";
    } else if (val == "1") {
      return "The Order is Beaning Prepared";
    } else if (val == "2") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getData() async {
    pendingOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    pendingData
        .getPendingDate(myServices.sharedPreferences.getString("id").toString())
        .then((value) {
      log("$value");
      statusRequest = handlingData(value);
      if (StatusRequest.success == statusRequest) {
        if (value['status'] == "success") {
          List pending = value['data'];
          pendingOrders.addAll(pending.map((e) => OrdersModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failure;
        }
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
