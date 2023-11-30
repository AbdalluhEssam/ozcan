import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/core/class/statusrequest.dart';
import 'package:ozcan/core/constant/routes.dart';
import 'package:ozcan/core/services/services.dart';
import 'package:ozcan/data/model/address_model.dart';

import '../../core/constant/color.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/cart/checkout_data.dart';

class CheckOutController extends GetxController {
  CheckOutData checkOutData = Get.put(CheckOutData(Get.find()));
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? deliveryType;
  String addressId = "0";
  List<AddressModel> address = [];

  String? couponId;
  String? priceOrder;
  String? discountCoupon;

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddresss(String val) {
    addressId = val;
    update();
  }


  addCheckout() async {
    if (paymentMethod == null) {
      return Get.snackbar("error".tr, "notSelectPayment".tr,
          backgroundColor: AppColor.primaryColor,
          duration: const Duration(seconds: 1));
    }
    if (deliveryType == null) {
      return Get.snackbar("error".tr, "notSelectDelivery".tr,
          backgroundColor: AppColor.primaryColor,
          duration: const Duration(seconds: 1));
    }
    if (address.isEmpty) {
      return Get.snackbar("error".tr, "Please Select Shipping Address".tr,
          backgroundColor: AppColor.primaryColor,
          duration: const Duration(seconds: 1));
    }

    statusRequest = StatusRequest.loading;
    Map data = {
      "orders_usersid": myServices.sharedPreferences.getString("id").toString(),
      "orders_addressid": addressId.toString(),
      "orders_type": deliveryType.toString(),
      "orders_pricedelivery": 30.toString(),
      "orders_price": priceOrder.toString(),
      "orders_coupon": couponId.toString(),
      "orders_coupondiscount": discountCoupon.toString(),
      "orders_paymentmethod": paymentMethod.toString(),
    };
    var response = await checkOutData.checkOut(data);
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "notice".tr,
            messageText: Text("success".tr),
            backgroundColor: AppColor.primaryColor,
            duration: const Duration(seconds: 1));
        Get.offAllNamed(AppRoute.homeScreen);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    couponId = Get.arguments['couponId'];
    priceOrder = Get.arguments['priceorder'];
    discountCoupon = Get.arguments['discountcoupon'].toString();
    super.onInit();
  }
}
