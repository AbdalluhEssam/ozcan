import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ozcan/controller/home/chat_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "اهلا بك",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
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
                },
                icon: const Icon(Icons.call)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              controller.chat.isNotEmpty
                  ? Expanded(
                      child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,

                          itemBuilder: (context, index) {
                            if (controller.chat[index].sender ==
                                "user") {
                              return buildMyMessage(controller.chat[index],
                                  controller.categoriesColor!);
                            }
                            return buildMessage(controller.chat[index]);
                          },
                          separatorBuilder: (context, index) => const SizedBox(
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
              Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[300]!,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: Form(
                    key: controller.formKey,
                    child: Row(
                      children: [
                        Container(
                            height: 50,
                            color: controller.categoriesColor,
                            child: MaterialButton(
                              minWidth: 1,
                              onPressed: () {
                                controller.addMassage();
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
                          decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              hintText: 'تفصل بسؤالك ...',
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
  }

  whatsapp() async {
    await launchUrlString("whatsapp://send?phone=+9647746423382");
  }

  Widget buildMessage(MassageBotModel model) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          constraints: BoxConstraints(maxWidth: 300),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(10),
                bottomStart: Radius.circular(10),
                topStart: Radius.circular(10),
              )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: Text(model.description!)),
              const SizedBox(
                width: 5,
              ),
              Text(
                DateFormat('jm', 'en_US')
                    .format(DateTime.parse(model.createdAt!))
                    .toString(),
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      );

  Widget buildMyMessage(MassageBotModel model, Color color) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          constraints: BoxConstraints(maxWidth: 300),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                DateFormat('jm', 'en_US')
                    .format(DateTime.parse(model.createdAt!))
                    .toString(),
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 10),
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(child: Text(model.description!)),
            ],
          ),
        ),
      );
}
