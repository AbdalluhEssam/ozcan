import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/signup.dart';

abstract class SignUpController extends GetxController {
  signUp();

  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  Gender selectedGender = Gender.male;

  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;
  SignUpData signupData = SignUpData(Get.find());
  List data = [];

  bool isShowPassword = true;

  @override
  signUp() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
          username.text.trimLeft().trimRight(),
          password.text.trimLeft().trimRight(),
          email.text.trimLeft().trimRight(),
          phone.text.trimLeft().trimRight(),
          selectedGender.name);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 200) {
          Get.offNamed(AppRoute.successSignUp, arguments: {
            "email": email.text.trimLeft().trimRight(),
          });
          Get.snackbar(username.text.toString(), "signupmass".tr,
              icon: const Icon(Icons.account_circle_rounded),
              barBlur: 2,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              backgroundColor: AppColor.primaryColor.withOpacity(0.4),
              isDismissible: true,
              duration: const Duration(seconds: 3),
              colorText: AppColor.black,
              borderRadius: 80);
          myServices.sharedPreferences
              .setString("emailup", email.text.toString());
        } else if(response['status'] == 422){
          Get.defaultDialog(
              title: "Warning",
              middleText: "Phone Number Or Email Already Exists");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    username.dispose();
    super.dispose();
  }
}

enum Gender { male, female, other }
