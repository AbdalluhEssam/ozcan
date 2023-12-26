import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/controller/home/AboutUs_controller.dart';
import 'package:ozcan/core/class/handlingdataview.dart';
import 'package:ozcan/likeapi.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageassets.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AboutUsControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("about".tr),
      ),
      body: GetBuilder<AboutUsControllerImp>(
        builder: (controller) => HandlingDataViewNot(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child:CachedNetworkImage(
                      imageUrl: "${AppLink.imageItems}/${controller.aboutUsModel.image}",
                      alignment: Alignment.center,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 15),
                      child: Text(
                        "${controller.aboutUsModel.body}",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 13, color: AppColor.black),
                      )),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Ozcan | ©2023")],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
