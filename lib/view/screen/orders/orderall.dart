import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/controller/orders/archive_controller.dart';
import 'package:ozcan/core/class/handlingdataview.dart';
import 'package:ozcan/view/screen/orders/pending.dart';

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
