import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/data/datasource/remote/chat_data.dart';
import 'package:ozcan/data/model/massage_model.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';

abstract class ChatController extends GetxController {
  initialData();

  viewChat();

  addMassage();
}

class ChatControllerImp extends ChatController {
  MyServices myServices = Get.find();
  ChatData chatData = ChatData(Get.find());

  List<MassageModel> chat = [];
  late TextEditingController myControllerMassage;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late Timer _timer;

  late StatusRequest statusRequest;
  String? idUser;
  String? username;
  String? email;
  String? categoriesId;
  String? categoriesName;
  String? adminId;
  String? itemsName;
  Color? categoriesColor;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    idUser = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    categoriesId = Get.arguments['categoriesId'];
    categoriesName = Get.arguments['categoriesName'];
    categoriesColor = Get.arguments['color'];
    adminId = Get.arguments['adminId'];
    itemsName = Get.arguments['itemsName'];
    itemsName = itemsName  != null ? "${"اريد الاستفسار عن " + itemsName!}" : "";
    myControllerMassage = TextEditingController(text: itemsName ?? "");
    initialData();
    log("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa///// $idUser");
    viewChat();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) => viewChat());
    super.onInit();
  }

  @override
  addMassage() async {
    var response = await chatData.addMassage(adminId.toString(),
        idUser.toString(), idUser.toString(), myControllerMassage.text);
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        myControllerMassage.clear();
        viewChat();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void dispose() {
    _timer.cancel();
    myControllerMassage.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  @override
  viewChat() async {
    chat.clear();
    var response =
        await chatData.getData(adminId.toString(), idUser.toString());
    log("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List massage = response['data'];
        chat.addAll(massage.map((e) => MassageModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
