import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ozcan/controller/orders/archive_controller.dart';
import 'package:ozcan/core/class/handlingdataview.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/orders_model.dart';
import '../../../likeapi.dart';

class OrdersAll extends StatelessWidget {
  const OrdersAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersAllController controller = Get.put(OrdersAllController());

    // Check if categoriesColor is not null before using it
    Color? primaryColor = controller.categoriesColor != null
        ? Color(int.parse("0xff" + controller.categoriesColor!))
        : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الطلبات",
          style: TextStyle(color: primaryColor),
        ),
        iconTheme:
            primaryColor != null ? IconThemeData(color: primaryColor) : null,
      ),
      body: GetBuilder<OrdersAllController>(
        init: Get.put(OrdersAllController()),
        builder: (controller) => HandlingDataViewNot(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) => CardListOrders(
                ordersModel: controller.pendingOrders[index],
              ),
              itemCount: controller.pendingOrders.length,
            ),
          ),
        ),
      ),
    );
  }
}
class CardListOrders extends GetView<OrdersAllController> {
  final OrdersModel ordersModel;

  const CardListOrders({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    OrdersAllController controller = Get.put(OrdersAllController());
    Color primaryColor = Color(int.parse("0xff" + controller.categoriesColor!));
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${"idorder".tr} : #${ordersModel.ordersId}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat.yMEd()
                      .format(DateTime.parse(ordersModel.ordersTime!)),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: primaryColor),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text("حالة الطلب : "),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: double.parse(ordersModel.ordersStatus!) ==
                                  0
                                  ? Colors.cyan
                                  : double.parse(ordersModel.ordersStatus!) == 1
                                  ? Colors.greenAccent
                                  : double.parse(
                                  ordersModel.ordersStatus!) ==
                                  2
                                  ? Colors.grey
                                  : double.parse(ordersModel
                                  .ordersStatus!) ==
                                  3
                                  ? AppColor.bg.withOpacity(0.5)
                                  : double.parse(ordersModel
                                  .ordersStatus!) ==
                                  4
                                  ? AppColor.green
                                  : Colors.red),
                          child: Text(
                            controller
                                .printOrderStatus(ordersModel.ordersStatus!),
                            style: const TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "المنتج  : ${ordersModel.itemsName}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                CachedNetworkImage(
                  imageUrl: "${AppLink.imageItems}/${ordersModel.itemsImage}",
                  height: Get.width * 0.25,
                  width: Get.width * 0.25,
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "اجمالى المبلغ  : ${ordersModel.ordersTotalprice} \$",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                MaterialButton(
                  onPressed: () {
                    if (ordersModel.link != "لا يوجد") {
                      facebook(ordersModel.link.toString());
                      // Get.toNamed(AppRoute.chatScreenWeb,
                      //     arguments: {"link": ordersModel.link.toString()});
                    } else {
                      Get.snackbar(
                          "${controller.myServices.sharedPreferences.getString("username")} ",
                          "عذرا برجاء الانتظار".tr,
                          icon: const Icon(Icons.person),
                          barBlur: 2,
                          margin: const EdgeInsets.symmetric(horizontal: 0),
                          backgroundColor: primaryColor,
                          isDismissible: true,
                          duration: const Duration(seconds: 3),
                          colorText: AppColor.white,
                          borderRadius: 0);
                    }
                  },
                  color: primaryColor,
                  textColor: AppColor.backgroundColor,
                  child: const Text("تتبع طلبك"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  facebook(url) async {
    await launchUrlString(url);
  }
}
