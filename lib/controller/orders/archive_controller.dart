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
  RegExp urlRegExp = RegExp(
    r"http(s)?://([\w-]+\.)+[\w-]+(/[\w- ;,./?%&=]*)?",
    caseSensitive: false,
  );
  bool containsLink(String text) {
    return urlRegExp.hasMatch(text);
  }
  @override
  void onInit() {
    categoriesId = Get.arguments['categoriesId'].toString();
    categoriesColor = Get.arguments['categoriesColor'];
    getData();
    super.onInit();
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "فى الانتظار";
    } else if (val == "1") {
      return "تم الموافقة على طلبك";
    } else if (val == "2") {
      return "فى الطريق";
    } else if (val == "5") {
      return "تم الغاء الطلب";
    } else {
      return "تم الانتهاء";
    }
  }

  getData() async {
    pendingOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    pendingData
        .archiveOrders(myServices.sharedPreferences.getString("id").toString(),
            categoriesId.toString())
        .then((value) {
      log("$value");
      statusRequest = handlingData(value);
      if (StatusRequest.success == statusRequest) {
        if (value['status'] == "success") {
          List pending = value['orders'];
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
