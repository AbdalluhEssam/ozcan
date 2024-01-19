import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ozcan/controller/home/chat_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:voice_message_package/voice_message_package.dart';
import '../../../data/model/massage_model.dart';

class ChatsDetailsScreen extends StatelessWidget {
  const ChatsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChatControllerImp());
    return Builder(builder: (context) {
      return GetBuilder<ChatControllerImp>(
        init: Get.put(ChatControllerImp()),
        builder: (controller) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            titleSpacing: 0,
            title: Row(
              children: [
                CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/call.png")),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "خدمة العملاء",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "اهلا بك",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(height: 1),
                      textAlign: TextAlign.end,
                    )
                  ],
                )
              ],
            ),
            // bottom: Tab(
            //   height: 30,
            //   iconMargin: EdgeInsets.zero,
            //   text:
            //       "${controller.chat.isNotEmpty ? Jiffy.parse(controller.chat.last.t).EEEE : "محادثة جديدة"}",
            // ),
            foregroundColor: controller.categoriesColor,
            elevation: 5,
            actions: [
              IconButton(
                  onPressed: () {
                    whatsapp();
                    // controller.viewChat();
                  },
                  icon: const Icon(Icons.call)),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                controller.chat.isNotEmpty
                    ? Expanded(
                        child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(vertical: 20),
                            controller: controller.scrollController,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              if (controller.chat[index].usr ==
                                  "${controller.username}") {
                                return buildMyMessage(controller.chat[index],
                                    controller.categoriesColor!);
                              }
                              return GetBuilder<ChatControllerImp>(
                                builder: (controller) =>
                                    buildMessage(controller.chat[index]),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 8,
                                ),
                            itemCount: controller.chat.length),
                      ))
                    : Expanded(
                        child: Center(
                            child: Text(
                          "أهلاً بك! تحدث الآن مع أحد ممثلي خدمة العملاء.",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )),
                      ),
                if (controller.hasLink)
                  Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          color: controller.categoriesColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: CachedNetworkImage(
                        imageUrl: "${controller.enteredText}",
                        height: Get.width * 0.4,
                        width: Get.width,
                      )),
                if (controller.hasLinkController)
                  Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          color: controller.categoriesColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${controller.extractLink(controller.myControllerMassage.text)}",
                        height: Get.width * 0.4,
                        width: Get.width,
                      )),
                Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 50,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                        borderRadius:BorderRadius.only(

                            topRight: Radius.circular(20),
                            topLeft:  Radius.circular(50),
                            bottomRight:  Radius.circular(20),
                            bottomLeft:  Radius.circular(50),

                        )),
                    child: Form(
                      key: controller.formKey,
                      child: Row(
                        children: [
                          Container(
                              height: 55,
                              color: controller.categoriesColor,
                              child: MaterialButton(
                                minWidth: 1,
                                onPressed: () {
                                  controller.addMassage();
                                  controller.hasLink = false;
                                },
                                child: Icon(
                                  FontAwesome5.telegram_plane,
                                  color: Colors.white,
                                ),
                              )),
                          Expanded(
                              child: TextFormField(
                            controller: controller.myControllerMassage,
                            minLines: 1,
                            maxLines: 2,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'not message';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: Colors.white),
                                  child: IconButton(
                                    onPressed: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles(
                                              dialogTitle:
                                                  'Select a File For Ozcan');
                                      if (result != null) {
                                        PlatformFile file = result.files.single;
                                        controller.myFlie = File(file.path!);
                                        controller.addImage();
                                      } else {
                                        print("No Image Selected");
                                      }
                                    },
                                    color: controller.myFlie == null
                                        ? controller.categoriesColor
                                        : Colors.green,
                                    icon: controller.myFlie == null
                                        ? const Icon(
                                            FontAwesome5.images,
                                          )
                                        : const Icon(
                                            Icons.done,
                                          ),
                                  ),
                                ),
                                suffixIcon: Container(
                                    height: 40,
                                    margin:
                                        const EdgeInsets.fromLTRB(5, 5, 10, 5),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  controller.recording == true
                                                      ? Colors.white
                                                      : Colors.black12,
                                              spreadRadius: 4)
                                        ],
                                        color: controller.recording == true
                                            ? Colors.red
                                            : controller.categoriesColor,
                                        shape: BoxShape.circle),
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.startStopRecord();
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(4),
                                          child: Icon(
                                            controller.recording == true
                                                ? Icons.stop
                                                : Icons.mic,
                                            color: Colors.white,
                                            size: 30,
                                          )),
                                    )),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                hintText: controller.recording == true
                                    ? 'جارى تسجيل مقطع صوت ...'
                                    : 'تفصل بسؤالك ...',
                                border: InputBorder.none),
                          )),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }

  whatsapp() async {
    await launchUrlString("whatsapp://send?phone=+9647746423382");
  }

  Widget buildMessage(Ticket model) {
    ChatControllerImp controller = Get.put(ChatControllerImp());
    if (model.msg!.contains("confirmBtn")) {
      if (!controller.ordersId.any((element) => element.containsAll(
          {int.parse(controller.extractConfirmationCode(model.msg!)), 0}))) {
        if (!controller.ordersId.any((element) => element.containsAll(
            {int.parse(controller.extractConfirmationCode(model.msg!)), 1}))) {
          controller.orderId(controller.extractConfirmationCode(model.msg!));
        }
      }
      log(controller.indexOrder.toString());
    }
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: model.msg!.contains("mp3") == true ||
              model.msg!.contains("ogg") == true
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                VoiceMessageView(
                  circlesColor: controller.categoriesColor!,
                  backgroundColor: Colors.grey[300]!,
                  controller: VoiceController(
                    audioSrc: '${controller.extractLink(model.msg!)}',
                    maxDuration: const Duration(seconds: 10),
                    isFile: true,
                    onComplete: () {},
                    onPause: () {},
                    onPlaying: () {},
                    onError: (err) {
                      print('Error: $err');
                    },
                  ),
                ),
                Text(
                  DateFormat.yMMMMd('ar_EG')
                      .format(DateTime.parse(model.t))
                      .toString(),
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            )
          : Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      constraints: BoxConstraints(maxWidth: 300),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(10),
                            bottomStart: Radius.circular(10),
                            topStart: Radius.circular(10),
                          )),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                              child: controller.containsLink(model.msg!)
                                  ? GestureDetector(
                                      onTap: () {
                                        controller.myControllerMassage.text =
                                            "\n\n${controller.extractLink(model.msg!)}";
                                        controller.hasLinkController = true;
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                '${controller.extractLink(model.msg!)}',
                                            maxHeightDiskCache: 200,
                                          ),
                                          Text(controller
                                              .removeLinks(model.msg!)
                                              .replaceAll('<p>', '')
                                              .replaceAll('</p>', '')
                                              .replaceAll('<pre>', '')
                                              .replaceAll('</pre>', '')
                                              .replaceAll('<br />', '')
                                              .replaceAll('<br>', '')
                                              .replaceAll('confirmBtn|', '')
                                              .replaceAll('|', '')
                                              .replaceAll(
                                                  '${controller.extractConfirmationCode(model.msg!)}',
                                                  '')),
                                          if (!controller.isDateTimeAfter48Hours(
                                              DateTime.parse(model.t).subtract(
                                                  Duration(hours: 47))))
                                            if (model.msg!
                                                .contains("confirmBtn"))
                                              OutlinedButton.icon(
                                                  style: ButtonStyle(
                                                      minimumSize: MaterialStatePropertyAll(
                                                          Size(Get.width, 40)),
                                                      alignment:
                                                          Alignment.center,
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(controller
                                                                  .ordersId
                                                                  .any((element) =>
                                                                      element.containsAll({int.parse(controller.extractConfirmationCode(model.msg!)), 1}))
                                                              ? Colors.greenAccent
                                                              : Colors.green)),
                                                  onPressed: () {
                                                    if (controller.ordersId.any(
                                                        (element) => element
                                                                .containsAll({
                                                              int.parse(controller
                                                                  .extractConfirmationCode(
                                                                      model
                                                                          .msg!)),
                                                              0
                                                            }))) {
                                                      controller.editStatus(
                                                          controller
                                                              .extractConfirmationCode(
                                                                  model.msg!));
                                                    }
                                                  },
                                                  icon: Icon(Icons.add_shopping_cart_outlined, color: Colors.white),
                                                  label: Text(
                                                    controller.ordersId.any(
                                                            (element) => element
                                                                    .containsAll({
                                                                  int.parse(controller
                                                                      .extractConfirmationCode(
                                                                          model
                                                                              .msg!)),
                                                                  1
                                                                }))
                                                        ? "تم التثبيت"
                                                        : "تثبيت",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ))
                                        ],
                                      ),
                                    )
                                  : Text(model.msg!
                                      .replaceAll('<p>', '')
                                      .replaceAll('</p>', '')
                                      .replaceAll('<pre>', '')
                                      .replaceAll('</pre>', ''))),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            DateFormat.jm('ar_EG')
                                .format(DateTime.parse(model.t))
                                .toString(),
                            textAlign: TextAlign.right,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      )),
                  Text(
                    DateFormat.yMMMMd('ar_EG')
                        .format(DateTime.parse(model.t))
                        .toString(),
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildMyMessage(Ticket model, Color color) {
    ChatControllerImp controller = Get.put(ChatControllerImp());
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: model.msg!.contains("mp3") == true ||
              model.msg!.contains("ogg") == true
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VoiceMessageView(
                  circlesColor: controller.categoriesColor!,
                  backgroundColor: controller.categoriesColor!.withOpacity(0.2),
                  controller: VoiceController(
                    audioSrc: '${controller.extractLink(model.msg!)}',
                    maxDuration: const Duration(seconds: 10),
                    isFile: false,
                    onComplete: () {},
                    onPause: () {},
                    onPlaying: () {},
                    onError: (err) {
                      print('Error: $err');
                    },
                  ),
                ),
                Text(
                  DateFormat.yMMMMd('ar_EG')
                      .format(DateTime.parse(model.t))
                      .toString(),
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            )
          : Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                          color: color.withOpacity(0.4),
                          borderRadius: const BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(10),
                            bottomStart: Radius.circular(10),
                            topEnd: Radius.circular(10),
                          )),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            DateFormat.jm('ar_EG')
                                .format(DateTime.parse(model.t))
                                .toString(),
                            textAlign: TextAlign.right,
                            style: const TextStyle(fontSize: 10),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                              child: controller.containsLink(model.msg!)
                                  ? GestureDetector(
                                      onTap: () {
                                        controller.myControllerMassage.text =
                                            "\n\n${controller.extractLink(model.msg!)}";

                                        controller.hasLinkController = true;
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                '${controller.extractLink(model.msg!)}',
                                            maxHeightDiskCache: 200,
                                          ),
                                          Text(controller
                                              .removeLinks(model.msg!)
                                              .replaceAll('<p>', '')
                                              .replaceAll('</p>', '')
                                              .replaceAll('<pre>', '')
                                              .replaceAll('</pre>', '')),
                                        ],
                                      ),
                                    )
                                  : Text(model.msg!
                                      .replaceAll('<p>', '')
                                      .replaceAll('</p>', '')
                                      .replaceAll('<pre>', '')
                                      .replaceAll('</pre>', ''))),
                        ],
                      )),
                  Text(
                    DateFormat.yMMMMd('ar_EG')
                        .format(DateTime.parse(model.t))
                        .toString(),
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
    );
  }
}
