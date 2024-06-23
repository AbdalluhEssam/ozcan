import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController {
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController password;
  late TextEditingController repassword;

  String? email;
  String? otp;

  @override
  goToSuccessResetPassword() async {
    log(otp.toString());
    if (password.text != repassword.text) {
      return Get.defaultDialog(title: "Waring", middleText: "Password Not Match");
    }
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(
          otp.toString(), email.toString(), password.text, repassword.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        Get.offNamed(AppRoute.successResetPassword);
      } else {
        Get.defaultDialog(title: "Warning", middleText: " Try Again");
        statusRequest = StatusRequest.none;

      }
      update();
    } else {
      print("object");
    }
  }

  @override
  void onInit() {
    otp = Get.arguments['otp'];
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
