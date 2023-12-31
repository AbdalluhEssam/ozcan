import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/data/datasource/remote/chat_data.dart';
import 'package:ozcan/data/model/massage_model.dart';
import 'package:ozcan/likeapi.dart';
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
  RegExp urlRegExp = RegExp(r"http(s)?://([\w-]+\.)+[\w-]+(/[\w- ;,./?%&=]*)?",
      caseSensitive: false, multiLine: true);
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
  List<MassageBotModel> chatNew = [];
  late UserTicketsModel ticket ;
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
  int? index;
  int indexOrder = 0;
  Color? categoriesColor;
  List ordersId = [];

  File? myFlie;

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
      Timer(Duration(seconds: 3), () {
        addFirst();
      });
    }
    if (ticketId != "null") {
      viewChat();
    }

    log("***********************************  $ticketId");
    if (chat.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Scroll to the end of the list
        if (scrollController != null) {
          // Scroll to the end of the list
          scrollController.jumpTo(scrollController.position.extentTotal);
        }
      });
    }
    _timer = Timer.periodic(Duration(seconds: 2), (timer) => viewChat());
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

  addImage() async {
    var response = await chatData.addImage(myFlie!);
    log("========================================================================$response");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      myControllerMassage.text =
          "${AppLink.imageItems}/${response['image_name']}";
      addMassage();
      myControllerMassage.clear();
      hasLink = false;
      hasLinkController = false;
      myFlie = null;
      // viewChat();
    }
    update();
  }

  editStatus(id) async {
    ordersId.clear();
    var response = await chatData.editStatus(id.toString(), idUser.toString());
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      myControllerMassage.clear();
      hasLink = false;
      orderId(ordersId);
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
  }

  orderId(orderId) async {
    var response = await chatData.orderId(orderId);
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (!ordersId
            .any((element) => element.containsAll({int.parse(orderId), 0}))) {
          if (!ordersId
              .any((element) => element.containsAll({int.parse(orderId), 1}))) {
            ordersId.add({response["orders_id"], response["orders_status"]});
            update();
          }
        }
      }
    }

    log(ordersId.toString());
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
      if (response['message'] == "Already Ticket Found") {
        getTicket();
      } else {
        getTicket();
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
    if (ticketId != "null") {
      var response = await chatData.getData(ticketId.toString());
      log("========================================================================$response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] != "No Messages Found") {
          List massage = response['messages'];
          if (massage.length != chat.length) {
            chat.clear();
            chat.addAll(massage.map((e) => MassageBotModel.fromJson(e)));
          }
        } else {
          chat.clear();
        }
      }
    }

    if (chat.length != index) {
      index = chat.length;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Scroll to the end of the list
        if (scrollController != "null") {
          // Scroll to the end of the list
          scrollController.jumpTo(scrollController.position.extentTotal);
          // scrollController.jumpTo(scrollController.position.maxScrollExtent);
        }
      });
    }
    update();
  }

  getTicket() async {
    chat.clear();
    var response = await chatData.getTicketData(
        idUser.toString(), categoriesId.toString());
    log("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] != "No Ticket Yet") {
        ticket= UserTicketsModel.fromJson(response['User_Tickets']);
      } else {
        ticket = UserTicketsModel();
      }
    }
    log("message : ${ticket.id}");

    if (ticket.id!.isNotEmpty) {
      ticketId = ticket.id.toString();
      viewChat();
    }

    update();
  }
}
