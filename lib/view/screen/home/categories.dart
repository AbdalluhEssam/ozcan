import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/core/constant/routes.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../likeapi.dart';
import '../../widget/view/Choose_your_department.dart';

class CategoriesPage extends GetView<HomeControllerImp> {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "اختار القسم الخاص بك",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
        ),
        body: GetBuilder<HomeControllerImp>(
            builder: (controller) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.separated(
                      itemBuilder: (context, index) => Department(
                          photo:'${AppLink.imageCategories}/${controller.categories[index]['categories_image']}',
                          onTap: () {
                            Get.toNamed(AppRoute.departmentView, arguments: {
                              "categoriesId": controller.categories[index]['categories_id'],
                              "categoriesName": controller.categories[index]['categories_name'],
                              "categoriesColor": controller.categories[index]['color'],
                              "adminId": controller.categories[index]['admin_id'],
                            });
                          }),
                      itemCount: controller.categories.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 12,
                      ),
                    )))));
  }
}
