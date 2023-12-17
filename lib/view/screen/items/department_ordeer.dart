import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/core/constant/routes.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../likeapi.dart';
import '../../widget/view/Choose_your_department.dart';

class DepartmentOrderView extends GetView<HomeControllerImp> {
  const DepartmentOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "اختار طلبات القسم الخاص بك",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
        ),
        body: GetBuilder<HomeControllerImp>(
            builder: (controller) => controller.myServices.sharedPreferences
                        .getString("username") !=
                    null
                ? Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: ListView.separated(
                          itemBuilder: (context, index) => Department(
                              photo:
                                  '${AppLink.imageCategories}/${controller.categories[index]['categories_image']}',
                              onTap: () {
                                Get.toNamed(AppRoute.ordersPending, arguments: {
                                  "categoriesId": controller.categories[index]
                                      ['categories_id'],
                                  "categoriesName": controller.categories[index]
                                      ['categories_name'],
                                  "categoriesColor":
                                      controller.categories[index]['color'],
                                  "adminId": controller.categories[index]
                                      ['admin_id'],
                                });
                              }),
                          itemCount: controller.categories.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            height: 12,
                          ),
                        )))
                : InkWell(
                    onTap: () {
                      Get.toNamed(AppRoute.login);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.login,
                            color: AppColor.primaryColor,
                            size: 55,
                          ),
                          Text(
                            "تسجيل الدخول".tr,
                            style: const TextStyle(
                                color: AppColor.primaryColor, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  )));
  }
}

// const SizedBox(
// height: 5,
// ),
// GestureDetector(
// onTap: () {
// Get.toNamed(AppRoute.ordersPending,
// arguments: {
// "categoriesId":
// controller.categoriesId,
// "adminId": controller.adminId,
// "categoriesName":
// controller.categoriesName,
// "color": primaryColor,
// });
// },
// child: Row(
// children: [
// Text(
// "طلباتك لهذا القسم",
// style: TextStyle(
// color: primaryColor,
// ),
// ),
// SizedBox(
// width: 12,
// ),
// Icon(
// Icons.shopping_cart,
// color: primaryColor,
// )
// ],
// ),
// ),
