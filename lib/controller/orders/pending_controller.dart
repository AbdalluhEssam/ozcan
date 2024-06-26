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

  String printOrderStatus(String val) {
    if (val == "0") {
      return "فى الانتظار";
    } else if (val == "1") {
      return "تم الموافقة على طلبك";
    } else if (val == "2") {
      return "جارى الشحن";
    } else if (val == "3") {
      return "فى الطريق";
    } else if (val == "5") {
      return "تم الغاء الطلب";
    } else {
      return "تم استلام طلبك";
    }
  }

  getData() async {
    pendingOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    pendingData.getOrderDate(token).then((value) {
      log("$value");
      statusRequest = handlingData(value);
      if (StatusRequest.success == statusRequest) {
        List pending = value['data'];
        pendingOrders.addAll(pending.map((e) => OrdersModel.fromJson(e)));
        if( pending.isEmpty){
          statusRequest = StatusRequest.failure;
          update();
        }
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
