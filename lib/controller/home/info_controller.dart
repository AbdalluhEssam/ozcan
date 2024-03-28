import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ozcan/data/model/social_model.dart';
import '../../core/services/services.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/homedata.dart';

abstract class InfoController extends GetxController {
  initialData();
  getData();
}

class InfoControllerImp extends InfoController {
  MyServices myServices = Get.find();

  List<SocialAccountsModel> info = [];

  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;

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
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.infoData();
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        List infoA =  response['data'];
        info.addAll(infoA.map((e) => SocialAccountsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}

