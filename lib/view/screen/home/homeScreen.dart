import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/core/constant/color.dart';
import 'package:ozcan/core/constant/routes.dart';
import 'package:ozcan/core/functions/alertextiapp.dart';
import '../../../controller/home/homescreen_controller.dart';
import '../../widget/home/customButtonAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              appBar: AppBar(toolbarHeight: 0),
              backgroundColor: Colors.white,
              bottomNavigationBar: BottomAppBar(
                color: AppColor.white,
                padding: const EdgeInsets.all(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(controller.listPage.length, (index) {
                      return CustomButtonAppBar(
                        text: controller.bottomAppBar[index]['title'],
                        onPressed: () {
                          controller.changePage(index);
                        },
                        iconData: controller.bottomAppBar[index]['icon'],
                        isActive: controller.i == index ? true : false,
                      );
                    })
                  ],
                ),
              ),
              body: WillPopScope(
                onWillPop: alertExitApp,
                child: controller.listPage.elementAt(controller.i),
              ),
            ));
  }
}
