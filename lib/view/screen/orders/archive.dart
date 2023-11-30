import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ozcan/core/class/handlingdataview.dart';
import 'package:ozcan/core/constant/color.dart';
import 'package:ozcan/core/constant/routes.dart';
import 'package:ozcan/data/model/orders_model.dart';
import 'package:ozcan/view/widget/orders/dialograting.dart';

import '../../../controller/orders/archive_controller.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Archive"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersArchiveController>(
          builder: (controller) => HandlingDataViewNot(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    CardListOrders(
                  ordersModel: controller.pendingOrders[index],
                ),
                itemCount: controller.pendingOrders.length,
              )),
        ),
      ),
    );
  }
}

class CardListOrders extends GetView<OrdersArchiveController> {
  final OrdersModel ordersModel;

  const CardListOrders({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shadowColor: AppColor.black,
      color: AppColor.primaryColor.withOpacity(0.12),
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
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor),
                ),
              ],
            ),
            const Divider(),
            Text(
                "Order Type : ${ordersModel.ordersType == "0" ? "Delivery" : "Receive"}"),
            Text(
                "Order Price : ${controller.myServices.formatNumber(ordersModel.ordersPrice)} EG"),
            Text("Delivery Price : ${ordersModel.ordersPricedelivery} EG"),
            Text(
                "Payment Method : ${ordersModel.ordersPaymentmethod == "0" ? "Cash" : "Payment Card"}"),
            Row(
              children: [
                const Text("Order Status : "),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: double.parse(ordersModel.ordersStatus!) == 0
                          ? Colors.cyan
                          : double.parse(ordersModel.ordersStatus!) == 1
                              ? Colors.greenAccent
                              : double.parse(ordersModel.ordersStatus!) == 2
                                  ? Colors.grey
                                  : double.parse(ordersModel.ordersStatus!) == 3
                                      ? AppColor.bg.withOpacity(0.5)
                                      : double.parse(
                                                  ordersModel.ordersStatus!) ==
                                              4
                                          ? AppColor.green
                                          : Colors.red),
                  child: Text(
                    controller.printOrderStatus(ordersModel.ordersStatus!),
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Price : ${controller.myServices.formatNumber(ordersModel.ordersTotalprice)} EG",
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                MaterialButton(
                  minWidth: 30,
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersDetails,
                        arguments: {"ordersModel": ordersModel});
                  },
                  color: AppColor.primaryColor,
                  textColor: AppColor.backgroundColor,
                  child: const Text("Order Details"),
                ),
              ],
            ),
            if (ordersModel.ordersRating == "0") const Divider(),
            if (ordersModel.ordersRating == "0")
              MaterialButton(
                onPressed: () {
                  showDialogRating(context, ordersModel.ordersId.toString());
                },
                color: AppColor.primaryColor,
                textColor: AppColor.backgroundColor,
                child: const Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star_half_sharp),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Rating"),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.star_half_sharp)
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
