import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart' show Jiffy;
import '../../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../controller/notification_controller.dart';

class NotificationScreen extends GetView<NotificationControllerImp> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationControllerImp controller = Get.put(NotificationControllerImp());
    Color primaryColor = Color(int.parse("0xff" + controller.categoriesColor!));

    return Scaffold(
        appBar: AppBar(
          title:  Text("Notification",style: TextStyle(
            color: primaryColor
          ),),
          centerTitle: true,
          foregroundColor: primaryColor,
          automaticallyImplyLeading: true,
        ),
        body: GetBuilder<NotificationControllerImp>(
          builder: (controller) => HandlingDataViewNotification(
              statusRequest: controller.statusRequest,
              widget: ListView.separated(
                itemCount: controller.notification.length,
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                          color: AppColor.backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:  [
                            BoxShadow(
                                color: primaryColor, blurRadius: 5)
                          ]),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed("${controller.notification[index].pagename}",arguments: {
                            "adminId": controller.adminId,
                            "categoriesName": controller.categoriesName,
                            "categoriesId": controller.categoriesId,
                            "categoriesColor": controller.categoriesColor,

                          });
                        },
                        child: Card(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${controller.notification[index].notificationTitle}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        "${controller.notification[index].notificationBody}",
                                        style: const TextStyle(
                                            fontSize: 12, color: AppColor.black)),
                                  ],
                                ),
                              ),
                              Text(
                                  Jiffy.parse("${DateTime.parse(controller.notification[index].createAt!)}")
                                      .fromNow(),
                                  style: const TextStyle(fontSize: 10, color: AppColor.gray))
                            ],
                          ),
                        )),
                      ));
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 15),
              )),
        ));
  }
}
