import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/data/datasource/remote/chat_data.dart';
import 'package:ozcan/data/model/massage_model.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
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
  RegExp urlRegExp = RegExp(
    r"http(s)?://([\w-]+\.)+[\w-]+(/[\w- ;,./?%&=]*)?",
    caseSensitive: false,
  );
  bool hasLink = false;
  bool hasLinkController = false;

  bool containsLink(String text) {
    return urlRegExp.hasMatch(text);
  }

  String extractLink(String text) {
    RegExpMatch? match = urlRegExp.firstMatch(text);
    return match != null ? match.group(0)! : '';
  }

  String removeLinks(String text) {
    return text.replaceAll(urlRegExp, '');
  }

  final ScrollController scrollController = ScrollController();
  DateTime createdAt = DateTime.now()
      .subtract(Duration(hours: 47)); // Replace this with your model.createdAt

  bool isDateTimeAfter48Hours(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime after48Hours = now.add(Duration(hours: 48));
    log(dateTime.isAfter(after48Hours).toString());
    return dateTime.isAfter(after48Hours);
  }

  String extractConfirmationCode(String text) {
    RegExp regex = RegExp(r'confirmBtn\|(\d+)');
    Match? match = regex.firstMatch(text);
    return match != null ? match.group(1)! : '';
  }

  List<MassageBotModel> chat = [];
  List<UserTicketsModel> ticket = [];
  late TextEditingController myControllerMassage;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late Timer _timer;
  late String enteredText;
  late StatusRequest statusRequest;
  String? idUser;
  String? username;
  String? email;
  String? categoriesId;
  String? categoriesName;
  String? adminId;
  String? ticketId;
  String? itemsName;
  String? itemsImage;
  String? orderStatus;
  String? ordersId;
  Color? categoriesColor;
  List order = [];

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    idUser = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    initialData();
    categoriesId = Get.arguments['categoriesId'];
    categoriesName = Get.arguments['categoriesName'];
    categoriesColor = Get.arguments['color'];
    adminId = Get.arguments['adminId'];
    ticketId = Get.arguments['ticketId'].toString();
    itemsName = Get.arguments['itemsName'];
    itemsImage = Get.arguments['itemsImage'];
    if (itemsImage != null) {
      hasLink = true;
      enteredText = itemsImage!;
    }
    itemsName = itemsName != null
        ? "\n\n $itemsImage\n${"اريد الاستفسار عن " + itemsName!}"
        : "";
    myControllerMassage = TextEditingController(text: itemsName ?? "");
    if (ticketId == "null") {
      addFirst();
    }
    if (ticketId != "null") {
      viewChat();
    }

    log("***********************************  $ticketId");
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
      hasLink = false;
      hasLinkController = false;
      // viewChat();
    }
    update();
  }

  editStatus(orderId) async {
    var response = await chatData.editStatus(orderId.toString());
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      myControllerMassage.clear();
      hasLink = false;
      Get.snackbar("${myServices.sharedPreferences.getString("username")} ",
          "تم تثبيت طلبك بنجاح".tr,
          icon: const Icon(Icons.add_shopping_cart),
          barBlur: 2,
          margin: const EdgeInsets.symmetric(horizontal: 0),
          backgroundColor: AppColor.primaryColor.withOpacity(0.4),
          isDismissible: true,
          duration: const Duration(seconds: 3),
          colorText: AppColor.white,
          borderRadius: 0);
      // viewChat();
    }
    update();
  }

  orderId(orderId) async {
    var response = await chatData.orderId(orderId.toString());
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (!order.any((element) =>element['orders_status'] == response['orders_status'].toString() && element['orders_id'] =="${extractConfirmationCode(response['orders_id'].toString())}")){
          order.add({
            "orders_id": response['orders_id'].toString(),
            "orders_status": response['orders_status'].toString(),
          });
        }

        // orderStatus = response['orders_status'].toString();
        // ordersId = response['orders_id'].toString();
      }
    }
    log(order.toString());
  }

  addFirst() async {
    var response = await chatData.addFirstAcc(
      username.toString(),
      email.toString(),
      categoriesId.toString(),
      1.toString(),
      2.toString(),
      "New Ticket".toString(),
      "هل يمكننى التواصل مع احد ممثلى الخدمة".toString(),
      idUser.toString(),
    );

    log("========================================================================$response");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      log("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa/////  Message Sent ");
      getTicket();
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
    if (ticketId != "null") {
      var response = await chatData.getData(ticketId.toString());
      log("========================================================================$response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] != "No Messages Found") {
          List massage = response['messages'];
          chat.addAll(massage.map((e) => MassageBotModel.fromJson(e)));
        } else {
          chat.clear();
        }
      }
    }
    update();
  }

  getTicket() async {
    ticket.clear();
    chat.clear();
    var response = await chatData.getTicketData(
        idUser.toString(), categoriesId.toString());
    log("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] != "No Ticket Yet") {
        List massage = response['User_Tickets'];
        ticket.addAll(massage.map((e) => UserTicketsModel.fromJson(e)));
      } else {
        ticket = [];
      }
    }
    log("message : ${ticket.any((element) => element.category.toString() == categoriesId)}");

    if (ticket.isNotEmpty) {
      ticketId = ticket.last.id.toString();
      viewChat();
    }

    update();
  }
}
