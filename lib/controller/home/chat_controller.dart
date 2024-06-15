import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:ozcan/data/datasource/remote/chat_data.dart';
import 'package:ozcan/data/model/massage_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:socket_io_client/socket_io_client.dart';
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
  StreamSocket streamSocket = StreamSocket();
  IO.Socket socket = IO.io('https://sok.cp.ozcanbrand.com', <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': true,
  });

  void handleMessage(dynamic data) {
    final currentUser = idUser; // Replace with your current user ID
    final message = ConversationsModel.fromJson(data);

    // Check if the message is from the current user
    if (message.senderId == currentUser) {
      // Handle typing text clearing, if necessary
      print('Received message from self, clearing typing text.');
    }
    // Process and add the message to the list
    message.senderUsername = username;
    message.created = message.created.toString();
    messages.add(message);
    print('Received message: $message');
  }

  void sendMessage() {
    socket.emit("message", {
      'sender_id': int.parse(idUser.toString()),
      'sender_username': username.toString(),
      'receiver_id': int.parse(conversation.currentAdminId.toString()),
      'conversation_id': int.parse(conversationId.toString()),
      'content': myControllerMassage.text,
      'type': 'text',
      'file': null,
      'id': null,
      'created': '${DateFormat('h:mm a',"en").format(DateTime.now())}',
      'order_id': null,
      'order_status': null,
    });
    // addMassage();
    messages.add(ConversationsModel.fromJson({
      'id': null,
      'sender_id': idUser.toString(),
      'sender_username': username.toString(),
      'conversation_id': conversationId.toString(),
      'content': myControllerMassage.text,
      'type': 'text',
      'file': null,
      'created': '${DateFormat('h:mm a',"en").format(DateTime.now())}',
      'order_id': null,
      'order_status': null,
    }));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 1),
          curve: Curves.easeOut,
        );
      }
    });
    update();
    addMassage();
    myControllerMassage.clear();
  }

  void connectAndListen() async {
    // Initialize the socket connection

    // Open the socket connection

    // Handle socket connection
    socket.onConnect((_) {
      print('connect');
      socket.emit('newUser', {
        "user_id": int.parse(idUser.toString())
        // 'socket_id': socket.id,
      });
      log(idUser.toString());
      log(socket.id.toString());
    });

    // When an event is received from the server, data is added to the stream
    // socket.on('users', (data) {
    //   messages.addAll(data.map((e) => ConversationsModel.fromJson(e)));
    //   // streamSocket.addResponse(
    //   //     data); // Assuming streamSocket.addResponse(data) is a valid method
    //   log(messages.toString());
    // });

    socket.on('recevied_message', (data) {
      // log(data.toString());
      // streamSocket.addResponse(data); // Assuming streamSocket.addResponse(data) is a valid method
      handleMessageReceived(data);
      // log(data.toString());
    });

    // Handle socket disconnection
    socket.onDisconnect((_) => print('disconnect'));

    // Handle socket errors
    socket.onError((data) => print("Error --> $data"));
    socket.onConnecting((data) => print("Connecting --> $data"));
    socket.onConnectError((data) => print("Connect Error  --> $data"));

    // Optionally, handle reconnection events
    socket.onReconnect((data) => print("Reconnect --> $data"));
    socket.onReconnectAttempt((data) => print("Reconnect Attempt --> $data"));
    socket.onReconnecting((data) => print("Reconnecting --> $data"));
  }

  void handleMessageReceived(dynamic data) {
    log(data.toString());
    final message = ConversationsModel.fromJson(data);
    log(message.conversation_id.toString());
    log(conversationId.toString());
    if (message.conversation_id == conversationId) {
      // Clear typing text if necessary
      print('Received message: ${message.content}');
      message.senderUsername = message.senderUsername;
      message.created = message.created.toString();
      if (data is Map) {
        messages.add(message);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (scrollController.hasClients) {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: Duration(seconds: 1),
              curve: Curves.easeOut,
            );
          }
        });

        update();
        // isDone.toggle();
      }
    }
  }

  MyServices myServices = Get.find();
  ChatData chatData = ChatData(Get.find());
  RegExp urlRegExp = RegExp(r"http(s)?://([\w-]+\.)+[\w-]+(/[\w- ;,./?%&=]*)?",
      caseSensitive: false, multiLine: true);

  RegExp urlRegExpImage = RegExp(
    r"http(s)?://([\w-]+\.)+[\w-]+(/[\w- ;,./?%&=]*)?\.(jpeg|jpg|gif|png|bmp)",
    caseSensitive: false,
    multiLine: true,
  );

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

  String extractLinkImage(String text) {
    RegExpMatch? match = urlRegExpImage.firstMatch(text);
    return match != null ? match.group(0)! : '';
  }

  String removeLinks(String text) {
    return text.replaceAll(urlRegExp, '');
  }

  final ScrollController scrollController = ScrollController();

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
  String? conversationId;
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
  late Conversation conversation;

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
    // timer.cancel();
    // timer =  null;
    socket.onDisconnect((_) => print('disconnect'));
    audioPlayer.dispose();
    record.dispose();
    scrollController.dispose();
    myControllerMassage.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    // timer.cancel();
    // timer = null;
    socket.onDisconnect((_) => print('disconnect'));

    audioPlayer.dispose();
    record.dispose();
    scrollController.dispose();
    myControllerMassage.dispose();
    super.onClose();
  }

  late Timer timer;

  @override
  void onInit() async {
    conversation = Conversation();
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
    connectAndListen();
    // timer = Timer.periodic(Duration(seconds: 5), (timer) => getConversationsData());
    super.onInit();
  }

  @override
  addMassage() async {
    if (formKey.currentState!.validate()) {
      // statusRequest = StatusRequest.loading;
      // messages.clear();
      var response = await chatData.addMassage(token.toString(),
          conversationId.toString(), myControllerMassage.text, "text", "");
      log("========================================================================$response");
      // statusRequest = handlingData(response);

      // update();
    }
    // update();
  }

  imgGlr() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    debugPrint('path: ${image?.path}');

    if (image != null) {
      File? img = File(image.path);
      myFlie = img;
      addImage();
      update();
    } else {
      print("No Image Selected");
    }
    update();
  }

  addImage() async {
    var response = await chatData.addImage(
      token.toString(),
      conversationId.toString(),
      myControllerMassage.text,
      "image",
      myFlie!,
    );
    log("========================================================================$response");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      getConversationsData();
      // addMassage();
      myControllerMassage.clear();
      hasLink = false;
      hasLinkController = false;
      myFlie = null;
      // viewChat();
    }
    update();
  }

  addAudio(audio) async {
    var response = await chatData.addImage(
      token.toString(),
      conversationId.toString(),
      myControllerMassage.text,
      "audio",
      audio!,
    );
    log("========================================================================$response");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      getConversationsData();
      myControllerMassage.clear();
      hasLink = false;
      hasLinkController = false;
      myFlie = null;
    }
    update();
  }

  orderId(orderId) async {
    var response = await chatData.orderId(orderId, token);
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      getConversationsData();
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
    }

    log(ordersId.toString());
  }

  List<ConversationsModel> messages = [];

  getConversationsData() async {
    statusRequest = StatusRequest.loading;
    var response = await chatData.getConversationsData(
        token.toString(), categoriesId.toString());
    log("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      messages.clear();
      List message = response['data']['messages'];

      messages.addAll(message.map((e) => ConversationsModel.fromJson(e)));
      conversation = Conversation.fromJson(response['data']['conversation']);
      conversationId = conversation.id.toString();

      if (messages.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (scrollController.hasClients) {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: Duration(seconds: 1),
              curve: Curves.easeOut,
            );
          }
        });
      }
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
      addAudio(File(recordFilePath));
      if (recordFilePath != 'null') {
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
}

class StreamSocket {
  final _socketResponse = StreamController<dynamic>();

  void Function(dynamic) get addResponse => _socketResponse.sink.add;

  Stream<dynamic> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}

final streamSocket = StreamSocket();
