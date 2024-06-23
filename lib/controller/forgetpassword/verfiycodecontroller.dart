import 'dart:developer';

import 'package:get/get.dart';
import '../../core/constant/routes.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/forgetpassword/verfiycodeforget.dart';

abstract class VerfiyCodeController extends GetxController {
  goToResetPassword(String verfiyCodeResetPass);
}

class VerfiyCodeControllerImp extends VerfiyCodeController {
  String? email;
  String? otp;
  MyServices myServices = Get.find();

  VerfiyCodeForgetPasswordData verfiyCodeForgetPasswordData =
      VerfiyCodeForgetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  goToResetPassword(verfiyCodeResetPass) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiyCodeForgetPasswordData.postData(
        email!, verfiyCodeResetPass);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      log(verfiyCodeResetPass.toString());
      Get.offNamed(AppRoute.resetPassword, arguments: {
        "email": email,
        "otp": verfiyCodeResetPass,
      });
    } else {
      Get.defaultDialog(
          title: "Warning", middleText: "Verfiy Code Not Correct");
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    myServices.sharedPreferences.setString("email", email.toString());
    super.onInit();
  }
}
