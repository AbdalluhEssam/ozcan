import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/login.dart';

abstract class LoginController extends GetxController {
  login();

  goToSignUp();

  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());
  Map user = {};
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  StatusRequest statusRequest = StatusRequest.none;

  bool isShowPassword = true;
  MyServices myServices = Get.find();

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  loginFacebook() {
    // await FacebookAuth.instance.login(
    //   permissions: ["public_profile","email"]).then((value) => FacebookAuth.instance.getUserData().then((userData) async{
    //     user = userData;
    // }));
    // // await FacebookAuth.instance.webAndDesktopInitialize(
    // //   appId: "1082283402438136",
    // //   cookie: true,
    // //   xfbml: true,
    // //   version: "v15.0",
    // // );
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
          password.text.trim(), email.text.trimLeft().trimRight());
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 200) {
            myServices.sharedPreferences.setString("token", response['data']['token'].toString());
            myServices.sharedPreferences.setString("id", response['data']['user']['id'].toString());
            myServices.sharedPreferences
                .setString("username", response['data']['user']['name'].toString());
            myServices.sharedPreferences
                .setString("email", response['data']['user']['email'].toString());
            myServices.sharedPreferences
                .setString("phone", response['data']['user']['phone'].toString());
            myServices.sharedPreferences.setString("step", "2");
            Get.offAllNamed(AppRoute.mySplashScreen);
            Get.snackbar(
                "${myServices.sharedPreferences.getString("username")} ",
                "اهلا بك فى Ozcan  يومك سعيد".tr,
                icon: const Icon(Icons.person),
                barBlur: 2,
                margin: const EdgeInsets.symmetric(horizontal: 0),
                backgroundColor: AppColor.primaryColor.withOpacity(0.4),
                isDismissible: true,
                duration: const Duration(seconds: 3),
                colorText: AppColor.white,
                borderRadius: 0);

        }
      }else {
        Get.defaultDialog(
            title: "Warning", middleText: " Email Or Password Not Correct");
        statusRequest = StatusRequest.failure;
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
