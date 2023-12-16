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

  List<MassageBotModel> chat = [];
  List<UserTicketsModel> ticket = [];
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
  String ticketId = "0";
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
    itemsName = itemsName != null ? "${"اريد الاستفسار عن " + itemsName!}" : "";
    myControllerMassage = TextEditingController(text: itemsName ?? "");
    initialData();

    getTicket();

    viewChat();
    log("***********************************  $ticketId");
    log("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa///// $idUser");
    _timer = Timer.periodic(Duration(seconds: 5), (timer) => viewChat());
    super.onInit();
  }

  @override
  addMassage() async {
    var response = await chatData.addMassage(
        ticketId.toString(), myControllerMassage.text);
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      myControllerMassage.clear();
      viewChat();
    }
    update();
  }

  addFirst() async {
    var response = await chatData.addFirstAcc(
      username.toString(),
      email.toString(),
      adminId.toString(),
      1.toString(),
      2.toString(),
      "New Ticket".toString(),
      "هل يمكننى التواصل مع احد ممثلى الخدمة".toString(),
      idUser.toString(),
    );
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      myControllerMassage.clear();
      getTicket();
      log("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa/////  Message Sent ");

      viewChat();
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
    var response = await chatData.getData(ticketId.toString());
    log("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List massage = response['messages'];
      chat.addAll(massage.map((e) => MassageBotModel.fromJson(e)));
    }
    update();
  }

  getTicket() async {
    var response =
        await chatData.getTicketData(idUser.toString(), adminId.toString());
    log("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List massage = response['User_Tickets'];
      ticket.addAll(massage.map((e) => UserTicketsModel.fromJson(e)));
    }
    log("message : ${ticket.any((element) => element.category.toString() == adminId)}");
    if (ticket.isNotEmpty) {
      ticketId = ticket.last.id.toString();
      if (ticket.any((element) => element.category.toString() != adminId)) {
        addFirst();
      }
    }
    if (ticket.isEmpty) {
      addFirst();
    }
    update();
  }
}
