import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:ozcan/controller/home/chat_controller.dart';
import 'package:ozcan/core/constant/color.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:voice_message_package/voice_message_package.dart';
import '../../../data/model/massage_model.dart';

class ChatsDetailsScreen extends StatelessWidget {
  const ChatsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChatControllerImp());
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
                controller.messages.isNotEmpty
                    ? StreamBuilder(
                        stream: StreamSocket().getResponse,
                        builder: (context, snapshot) {
                          return Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListView.separated(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                controller: controller.scrollController,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  if (controller
                                          .messages[index].senderUsername ==
                                      "${controller.username}") {
                                    return buildMyMessage(
                                        controller.messages[index],
                                        controller.categoriesColor!,
                                        index);
                                  }
                                  return GetBuilder<ChatControllerImp>(
                                    builder: (controller) => buildMessage(
                                        controller.messages[index], index),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      height: 12,
                                    ),
                                itemCount: controller.messages.length),
                          ));
                        })
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
                      child: Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          CachedNetworkImage(
                            imageUrl: "${controller.enteredText}",
                            height: Get.width * 0.4,
                            width: Get.width,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 20,
                              child: IconButton(
                                  onPressed: () {
                                    controller.hasLink = false;
                                    controller.hasLinkController = false;
                                    controller.myControllerMassage.clear();
                                    controller.update();
                                  },
                                  icon: Icon(
                                    Icons.close,
                                  )),
                            ),
                          ),
                        ],
                      )),
                if (controller.hasLinkController)
                  Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          color: controller.categoriesColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "${controller.extractLink(controller.myControllerMassage.text)}",
                            height: Get.width * 0.4,
                            width: Get.width,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 20,
                              child: IconButton(
                                  onPressed: () {
                                    controller.hasLink = false;
                                    controller.hasLinkController = false;
                                    controller.myControllerMassage.clear();
                                    controller.update();
                                  },
                                  icon: Icon(
                                    Icons.close,
                                  )),
                            ),
                          ),
                        ],
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
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(50),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(50),
                        )),
                    child: Form(
                      key: controller.formKey,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              height: 55,
                              color: controller.categoriesColor,
                              child: MaterialButton(
                                minWidth: 1,
                                onPressed: () {
                                  controller.sendMessage();
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
                            maxLines: 3,
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
                                      controller.imgGlr();
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
          )),
    );
  }

  whatsapp() async {
    await launchUrlString("whatsapp://send?phone=+9647746423382");
  }

  Widget buildMessage(ConversationsModel model, index) {
    ChatControllerImp controller = Get.put(ChatControllerImp());
    if (model.type == 'audio') {
      return Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              VoiceMessageView(
                circlesColor: AppColor.red,
                backgroundColor: Colors.grey[300]!,
                controller: VoiceController(
                  audioSrc: model.file!,
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
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.created.toString(),
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              )
            ],
          ));
    }

    if (model.type == 'image') {
      return Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          constraints: BoxConstraints(maxWidth: 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  padding: controller.containsLinkImage(model.content!)
                      ? EdgeInsets.zero
                      : EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: const BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(10),
                        bottomStart: Radius.circular(10),
                        topEnd: Radius.circular(10),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                          child: GestureDetector(
                        onTap: () {
                          controller.myControllerMassage.text =
                              "\n\n${controller.extractLink(model.file!)}";
                          controller.enteredText =
                              "${controller.extractLink(model.file!)}";
                          controller.hasLinkController = true;
                          controller.update();
                        },
                        child: CachedNetworkImage(
                          imageUrl: '${model.file!}',
                          maxHeightDiskCache: 200,
                        ),
                      )),
                      if (model.content.toString() != "null")
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            model.content.toString(),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  )),
              Text(
                model.created.toString(),
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      );
    }

    if (model.type == 'order') {
      return Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          constraints: BoxConstraints(maxWidth: 300),
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            padding: controller.containsLinkImage(model.content!)
                ? EdgeInsets.zero
                : EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: const BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(10),
                  bottomStart: Radius.circular(10),
                  topEnd: Radius.circular(10),
                )),
            child: Column(
              children: [
                HtmlWidget(
                  """
                ${model.file}
                """,
                  customStylesBuilder: (element) {
                    if (element.localName == 'div') {
                      return {
                        'display': 'flex',
                        'flex-direction': 'column',
                        'gap': '8px',
                      };
                    }
                    if (element.localName == 'img') {
                      return {
                        'max-width': '350px',
                        'max-height': '400px',
                        'object-fit': 'cover',
                        'border-radius': '10px',
                        'cursor': 'pointer',
                      };
                    }
                    if (element.localName == 'p') {
                      return {
                        'padding-left': '8px',
                        'text-align': 'left',
                        'line-height': '0.2',
                        // Reducing line height to reduce space between lines
                      };
                    }
                    return null;
                  },
                  textStyle: TextStyle(
                    fontSize: 16,
                    height:
                        0.6, // Adjust the height to control the space between lines
                  ),
                ),
                OutlinedButton.icon(
                  style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(250, 45)),
                      foregroundColor: MaterialStatePropertyAll(
                          model.orderStatus == "pending" ||
                                  model.orderStatus == "cancelled"
                              ? Colors.white
                              : AppColor.black),
                      backgroundColor: MaterialStatePropertyAll(
                          model.orderStatus == "pending"
                              ? AppColor.green
                              : model.orderStatus == "cancelled"
                                  ? AppColor.red
                                  : Colors.greenAccent)),
                  onPressed: () {
                    if (model.orderStatus != "cancelled") {
                      if (model.orderStatus == "pending") {
                        controller.orderId(model.orderId.toString());
                      }
                    }
                  },
                  icon: Icon(
                    CupertinoIcons.cart,
                    size: 30,
                  ),
                  label: Text(
                    model.orderStatus == "pending"
                        ? "تثبيت"
                        : "تم التثبيت طلبك",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        ),
      );
    }

    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        constraints: BoxConstraints(maxWidth: 300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                padding: controller.containsLinkImage(model.content!)
                    ? EdgeInsets.zero
                    : EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: const BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(10),
                      bottomStart: Radius.circular(10),
                      topEnd: Radius.circular(10),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (controller.containsLink(model.content!))
                      Flexible(
                          child: RichText(
                              text: TextSpan(
                        text: controller.extractLink(model.content!),
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launchUrlString(
                                controller.extractLink(model.content!));
                          },
                      ))),
                    Text(controller
                        .removeLinks(model.content!)
                        .replaceAll('<p>', '')
                        .replaceAll('</p>', '')
                        .replaceAll('<pre>', '')
                        .replaceAll('</pre>', '')),
                    // Container(
                    //   margin: const EdgeInsets.only(right: 8, bottom: 8),
                    //   child: Text(
                    //     model.created!.toString(),
                    //     textAlign: TextAlign.right,
                    //     style: const TextStyle(fontSize: 10),
                    //   ),
                    // ),
                  ],
                )),
            Text(
              model.created!,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMyMessage(ConversationsModel model, Color color, index) {
    ChatControllerImp controller = Get.put(ChatControllerImp());
    if (model.type == 'audio') {
      return Align(
          alignment: AlignmentDirectional.centerStart,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              VoiceMessageView(
                circlesColor: controller.categoriesColor!,
                backgroundColor: Colors.grey[300]!,
                controller: VoiceController(
                  audioSrc: model.file!,
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
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.created.toString(),
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              )
            ],
          ));
    }

    if (model.type == 'image') {
      return Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          constraints: BoxConstraints(maxWidth: 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  padding: controller.containsLinkImage(model.content!)
                      ? EdgeInsets.zero
                      : EdgeInsets.only(bottom: 0),
                  decoration: BoxDecoration(
                      color: color.withOpacity(0.4),
                      borderRadius: const BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(10),
                        bottomStart: Radius.circular(10),
                        topEnd: Radius.circular(10),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Flexible(
                      //     child: RichText(
                      //         text: TextSpan(
                      //   text: controller.extractLink(model.content!),
                      //   style: TextStyle(
                      //       color: Colors.blue,
                      //       decoration: TextDecoration.underline),
                      //   recognizer: TapGestureRecognizer()
                      //     ..onTap = () async {
                      //       await launchUrlString(controller
                      //           .extractLink(model.content!));
                      //     },
                      // ))),
                      Flexible(
                          child: GestureDetector(
                        onTap: () {
                          controller.myControllerMassage.text =
                              "\n\n${controller.extractLink(model.file!)}";
                          controller.enteredText =
                              "${controller.extractLink(model.file!)}";

                          controller.hasLinkController = true;
                          controller.update();
                        },
                        child: CachedNetworkImage(
                          imageUrl: '${model.file!}',
                          maxHeightDiskCache: 200,
                        ),
                      )),
                      if (model.content.toString() != "null")
                        Text(
                          model.content.toString(),
                          textAlign: TextAlign.right,
                        ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  )),
              Text(
                model.created.toString(),
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      );
    }

    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        constraints: BoxConstraints(maxWidth: 300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                padding: controller.containsLinkImage(model.content!)
                    ? EdgeInsets.zero
                    : EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: color.withOpacity(0.4),
                    borderRadius: const BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(10),
                      bottomStart: Radius.circular(10),
                      topEnd: Radius.circular(10),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (controller.containsLinkImage(model.content!))
                      Flexible(
                          child: GestureDetector(
                        onTap: () {
                          controller.myControllerMassage.text =
                              "\n\n${controller.extractLinkImage(model.content!)}";
                          controller.hasLinkController = true;
                          controller.update();
                        },
                        child: CachedNetworkImage(
                          imageUrl:
                              '${controller.extractLinkImage(model.content!)}',
                          maxHeightDiskCache: 200,
                        ),
                      )),
                    if (controller.containsLink(model.content!) &&
                        !controller.containsLinkImage(model.content!))
                      Flexible(
                          child: RichText(
                              text: TextSpan(
                        text: controller.extractLink(model.content!),
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launchUrlString(
                                controller.extractLink(model.content!));
                          },
                      ))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(controller
                          .removeLinks(model.content!)
                          .replaceAll('<p>', '')
                          .replaceAll('</p>', '')
                          .replaceAll('<pre>', '')
                          .replaceAll('</pre>', '')),
                    ),
                  ],
                )),
            Text(
              model.created!,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
