import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/data/model/cart_model.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/cart/cart_data.dart';

abstract class CartController extends GetxController {
  initialData();

  add(String itemId);
}

class CartControllerImp extends CartController {
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());

  int? discountCoupon = 0;
  String? couponName;
  String? couponId;

  List<CartModel> cart = [];
  TextEditingController? myControllerCoupon;
  late StatusRequest statusRequest;
  String? idUser;
  String? username;
  String? email;

  double priceOrder = 0.0;
  int totalCountItems = 0;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    idUser = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    myControllerCoupon = TextEditingController();
    initialData();
    viewCart();
    super.onInit();
  }

  resetVarCart() {
    totalCountItems = 0;
    priceOrder = 0.0;
    cart.clear();
  }

  refreshPage() {
    resetVarCart();
    viewCart();
  }

  goToCheckOut() {
    Get.toNamed(AppRoute.checkOut, arguments: {
      "couponId": couponId ?? "0",
      "priceorder": priceOrder.toString(),
      "discountcoupon": discountCoupon.toString(),
    });
  }

  getTotalPrice() {
    return (priceOrder - priceOrder * discountCoupon! / 100);
  }

  @override
  add(String itemId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.addCart(itemId.toString());
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "notice".tr,
            messageText: Text("addCart".tr),
            backgroundColor: AppColor.primaryColor,
            duration: const Duration(seconds: 1));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  delete(String itemId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.deleteCart(itemId.toString());
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "notice".tr,
            messageText: Text("delCart".tr),
            backgroundColor: AppColor.primaryColor,
            duration: const Duration(seconds: 1));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.checkCoupon(myControllerCoupon!.text);
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> dataCoupon = response['data'];

        Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: "notice".tr,
            messageText: Text("apply".tr),
            backgroundColor: AppColor.primaryColor,
            duration: const Duration(seconds: 1));
      } else {
        discountCoupon = 0;
        couponName = null;
        couponId = null;
        Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: "notice".tr,
            messageText: Text("couponfill".tr),
            backgroundColor: AppColor.primaryColor,
            duration: const Duration(seconds: 1));

        // statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCountItems(String itemId) async {
    statusRequest = StatusRequest.loading;

    var response = await cartData.getCountCart(itemId.toString());
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int count = 0;
        count = int.parse(response['data']);
        if (kDebugMode) {
          print(
              "////////////////////////////////////////$count/////////////////");
        }
        return count;
        // items.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  viewCart() async {
    // cart.clear();
    statusRequest = StatusRequest.loading;
    update();
    // var response = await cartData.viewCart();
    // if (kDebugMode) {
    //   print(
    //       "========================================================================$response");
    // }
    // statusRequest = handlingData(response);
    // if (StatusRequest.success == statusRequest) {
    //   if (response['status'] == "success") {
    //     cart.clear();
    //     Map countPrice = response['countprice'];
    //     List dataCart = response['cart'];
    //     cart.addAll(dataCart.map((e) => CartModel.fromJson(e)));
    //     totalCountItems = int.parse(countPrice['totalcount']);
    //     priceOrder = double.parse(countPrice['totalprice']);
    //   } else {
    //     statusRequest = StatusRequest.failure;
    //   }
    // }
    update();
  }

  goToProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {"itemsModel": itemsModel});
  }
}
