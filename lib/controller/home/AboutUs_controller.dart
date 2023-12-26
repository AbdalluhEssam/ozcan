import 'dart:developer';
import 'package:get/get.dart';
import 'package:ozcan/data/model/AboutUs_model.dart';
import '../../core/services/services.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/homedata.dart';

abstract class AboutUsController extends GetxController {
  initialData();
  getData();
}

class AboutUsControllerImp extends AboutUsController {
  MyServices myServices = Get.find();

  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;
  late AboutUsModel aboutUsModel ;

  String? username;
  String? email;
  String? id;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    aboutUsModel = AboutUsModel();
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.aboutUs();
    log("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        aboutUsModel = AboutUsModel.fromJson(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}

