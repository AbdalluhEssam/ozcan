import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ozcan/controller/orders/pending_controller.dart';
import 'package:ozcan/core/class/handlingdataview.dart';
import 'package:ozcan/core/constant/color.dart';
import 'package:ozcan/core/constant/routes.dart';
import 'package:ozcan/data/model/orders_model.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersPendingController>(
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

class CardListOrders extends GetView<OrdersPendingController> {
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
            Text("Order Price : ${ordersModel.ordersPrice} EG"),
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
                          : double.parse(ordersModel.ordersStatus!) == 4
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
                  "Total Price : ${ordersModel.ordersTotalprice} EG",
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersDetails,
                        arguments: {"ordersModel": ordersModel});
                  },
                  color: AppColor.primaryColor,
                  textColor: AppColor.backgroundColor,
                  child: const Text("Order Details"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
