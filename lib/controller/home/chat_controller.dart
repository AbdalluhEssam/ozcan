import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:ozcan/data/datasource/remote/chat_data.dart';
import 'package:ozcan/data/model/massage_model.dart';
import 'package:ozcan/likeapi.dart';
import 'package:path_provider/path_provider.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import 'package:record/record.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

abstract class ChatController extends GetxController {
  initialData();

  addMassage();
}

class ChatControllerImp extends ChatController {
  IO.Socket socket = IO.io("https://sok.cp.ozcanbrand.com/");

  MyServices myServices = Get.find();
  ChatData chatData = ChatData(Get.find());
  RegExp urlRegExp = RegExp(r"http(s)?://([\w-]+\.)+[\w-]+(/[\w- ;,./?%&=]*)?",
      caseSensitive: false, multiLine: true);

  RegExp urlRegExpImage = RegExp(
    r"http(s)?://([\w-]+\.)+[\w-]+(/[\w- ;,./?%&=]*)?\.(jpeg|jpg|gif|png|bmp)",
    caseSensitive: false,
    multiLine: true,
  );

  final RegExp urlRegExpAudio = RegExp(r'https?://\S+');

  bool hasLink = false;
  bool hasLinkController = false;

  bool containsLink(String text) {
    return urlRegExp.hasMatch(text);
  }

  bool containsLinkImage(String text) {
    return urlRegExpImage.hasMatch(text);
  }

  String extractLink(String text) {
    RegExpMatch? match = urlRegExp.firstMatch(text);
    return match != null ? match.group(0)! : '';
  }

  String extractLinkAudio(String text) {
    RegExpMatch? match = urlRegExpAudio.firstMatch(text);
    return match != null ? match.group(0)! : '';
  }

  String extractLinkImage(String text) {
    RegExpMatch? match = urlRegExpImage.firstMatch(text);
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

  TextEditingController myControllerMassage = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // late Timer _timer;
  late String enteredText;
  late StatusRequest statusRequest;
  String? idUser;
  String? token;
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
  int count = 0;
  Color? categoriesColor;
  List ordersId = [];
  bool showPlayer = false;
  File? myFlie;

  late String recordFilePath;
  final record = AudioRecorder();

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    idUser = myServices.sharedPreferences.getString("id");
    token = myServices.sharedPreferences.getString("token");
  }

  Future<void> playRecording() async {
    try {
      UrlSource urlSource = UrlSource(recordFilePath);
      await audioPlayer.play(urlSource);

      update();
    } catch (e) {
      log("Error stopping recording: $e");
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    record.dispose();
    super.dispose();
  }

  @override
  void onInit() async {
    // audioPlayer = AudioPlayer();
    // audioRecord = AudioRecorder();
    // initializeDateFormatting("ar");
    await Jiffy.setLocale("ar");
    // Intl("ar_EG");
    await Firebase.initializeApp();
    initialData();
    categoriesId = Get.arguments['categoriesId'];
    categoriesName = Get.arguments['categoriesName'];
    categoriesColor = Get.arguments['color'];
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
    getConversationsData();

    if (messages.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Scroll to the end of the list
        if (scrollController != null && scrollController.hasClients) {
          scrollController.jumpTo(scrollController.position.extentTotal);
        }
      });
    }
    // _timer = Timer.periodic(Duration(seconds: 2), (timer) => viewChat());
    super.onInit();
  }

  @override
  addMassage() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      messages.clear();
      var response = await chatData.addMassage(token.toString(),
          categoriesId.toString(), myControllerMassage.text, "text", "");
      log("========================================================================$response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        myControllerMassage.clear();
        getConversationsData();
      } else {
        statusRequest = StatusRequest.failure;
      }

      update();
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
      orderId(id);
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

  List<ConversationsModel> messages = [];
  DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  getConversationsData() async {
    statusRequest = StatusRequest.loading;
    messages.clear();
    var response = await chatData.getConversationsData(
        token.toString(), categoriesId.toString());
    log("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List message = response['data'];
      messages.addAll(message.map((e) => ConversationsModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  AudioPlayer audioPlayer = AudioPlayer();
  String audioURL = "";

  bool recording = false;

  recordingChanged(value) {
    recording = value;
    update();
  }

  Future<File> getTempFile(String fileName) async {
    final dir = await getTemporaryDirectory();
    return File('${dir.path}/$fileName');
  }

  getRecordingFile() async {
    final file = await getTempFile('$username.mp3');
    return file.path;
  }

  void startStopRecord() async {
    if (recording == true) {
      stopRecord();
      recordingChanged(false);
    } else {
      // Check and request permission
      if (await record.hasPermission()) {
        recordingChanged(true);
        recordFilePath = await getRecordingFile();
        // Start recording
        await record.start(
          RecordConfig(
            encoder: AudioEncoder.aacLc, // by default
            bitRate: 128000, // by default
          ),
          path: recordFilePath,
        );
      }
    }
  }

  void stopRecord() async {
    // Get the state of the recorder
    bool isRecording = await record.isRecording();
    if (isRecording == true) {
      await record.stop();
      var response = await chatData.addAudio(File(recordFilePath));
      log("========================================================================$response");

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        myControllerMassage.text =
            "${AppLink.imageItems}/${response['image_name']}";
      }
      if (recordFilePath != 'null') {
        addMassage();
        myControllerMassage.clear();

        recordFilePath = '';
      }
      // Stop recording
      await record.stop();
    }
    //39397
  }

  int i = 0;

  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String fileName = "test_${DateTime.now().microsecondsSinceEpoch}_$i.mp3";
    String filePath = "${storageDirectory.path}/$fileName";
    log(filePath);

    i++; // Increment the counter for the next file

    return filePath;
  }
// uploadAudio() async {
//   var response = await chatData.addAudio(File(recordFilePath));
//   log("========================================================================$response");
//
//   statusRequest = handlingData(response);
//   if (StatusRequest.success == statusRequest) {
//     myControllerMassage.text ="${AppLink.imageItems}/${response['image_name']}";
//     addMassage();
//     myControllerMassage.clear();
//     hasLink = false;
//     hasLinkController = false;
//     myFlie = null;
//     // viewChat();
//   }
//   update();
// }
}
