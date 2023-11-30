import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:ozcan/controller/home/info_controller.dart';
import 'package:ozcan/core/class/handlingdataview.dart';
import 'package:ozcan/likeapi.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../core/constant/color.dart';

import '../home/personinformation.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(InfoControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("اتصل بنا".tr),
      ),
      body: GetBuilder<InfoControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: AppColor.primaryColor,
                      height: 2,
                      width: 300,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        margin: EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("${controller.info[index]['name']}"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  CachedNetworkImage(
                                    imageUrl:
                                        "${AppLink.imageInfo}/${controller.info[index]['image']}",
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                              Divider(),
                              Text("${controller.info[index]['description']}"),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  buildMedia(
                                      icon: FontAwesome5.instagram,
                                      text: "Instagram",
                                      onPressed: () async {
                                        await facebook(
                                            "${controller.info[index]['instagram']}");
                                      }),
                                  buildMedia(
                                      icon: Icons.facebook,
                                      text: "Facebook",
                                      onPressed: () async {
                                        await facebook(
                                            "${controller.info[index]['facebook']}");
                                      }),
                                  buildMedia(
                                      icon: FontAwesome5.whatsapp,
                                      text: "Whatsapp",
                                      onPressed: () async {
                                        await whatsapp(
                                            "${controller.info[index]['phone']}");
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => Container(
                        color: AppColor.primaryColor,
                        height: 2,
                        width: 300,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      itemCount: controller.info.length,
                    ),
                    Container(
                      color: AppColor.primaryColor,
                      height: 2,
                      width: 300,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      child: const Text("Ozcan | ©2023"),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  whatsapp(String phone) async {
    await launchUrlString("whatsapp://send?phone=$phone");
  }

  facebook(url) async {
    await launchUrlString(url);
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  const color = AppColor.primaryColor;
  const hoverColor = AppColor.backgroundColor;
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: const TextStyle(color: hoverColor),
    ),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}
