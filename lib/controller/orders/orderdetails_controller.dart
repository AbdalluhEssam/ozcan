import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:ozcan/data/datasource/remote/orders/pending_data.dart';
import 'package:ozcan/data/model/orders_model.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';

abstract class OrderDetailsViewController extends GetxController {
  getDataCart();
}

class OrderDetailsViewControllerImp extends OrderDetailsViewController {
  MyServices myServices = Get.find();
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<OrdersDetailsModel> ordersDetails = [];
  late OrdersModel ordersModel;

  double? lat;
  double? long;
  late String orderId;

  late StatusRequest statusRequest;


  @override
  void onInit() {
    ordersModel = Get.arguments['ordersModel'];
    getDataCart();
    super.onInit();
  }

  @override
  Future getDataCart() async {
    ordersDetails.clear();
    statusRequest = StatusRequest.loading;
    var response = await ordersDetailsData.getDate(orderId.toString());
    log("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List details = response['data'];
        ordersDetails
            .addAll(details.map((e) => OrdersDetailsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    log("==============================================================================${ordersDetails.length}");
    update();
  }
}
