import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/controller/cart/checkout_controller.dart';
import 'package:ozcan/core/class/handlingdataview.dart';
import 'package:ozcan/core/constant/color.dart';
import 'package:ozcan/likeapi.dart';
import 'package:ozcan/view/widget/checkout/cardaddress.dart';
import 'package:ozcan/view/widget/checkout/carddelivery.dart';
import 'package:ozcan/view/widget/checkout/cardpaymentmethod.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CheckOutController());
    return Scaffold(
        backgroundColor: AppColor.black,
        appBar: AppBar(
          title: Text("checkoutpage".tr),
          centerTitle: true,
        ),
        bottomNavigationBar: GetBuilder<CheckOutController>(
            builder: (controller) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: AppColor.primaryColor,
                    textColor: AppColor.backgroundColor,
                    onPressed: () {
                      controller.addCheckout();
                    },
                    child: Text(
                      "checkout".tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                )),
        body: GetBuilder<CheckOutController>(
            builder: (controller) => HandlingDataViewNot(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      children: [
                        Text(
                          "choosepaymentmethod".tr,
                          style: const TextStyle(
                              fontSize: 16,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: () {
                              controller.choosePaymentMethod("0");
                            },
                            child: CardPaymentMethodCheckOut(
                                title: "shipping".tr,
                                isActive: controller.paymentMethod == "0"
                                    ? true
                                    : false)),
                        const SizedBox(
                          height: 14,
                        ),
                        InkWell(
                          onTap: () {
                            controller.choosePaymentMethod("1");
                          },
                          child: CardPaymentMethodCheckOut(
                              title: "electronicpayment".tr,
                              isActive: controller.paymentMethod == "1"
                                  ? true
                                  : false),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "deliverytayp".tr,
                          style: const TextStyle(
                              fontSize: 16,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.chooseDeliveryType("0");
                              },
                              child: CardDeliveryTypeCheckOut(
                                  imageName: "assets/images/delivery.png",
                                  title: "delivery".tr,
                                  isActive: controller.deliveryType == "0"
                                      ? true
                                      : false),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                controller.chooseDeliveryType("1");
                              },
                              child: CardDeliveryTypeCheckOut(
                                  imageName: "assets/images/drive.png",
                                  title: "drivethru".tr,
                                  isActive: controller.deliveryType == "1"
                                      ? true
                                      : false),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        controller.deliveryType == "0"
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (controller.address.isNotEmpty)
                                    Text(
                                      "shippingaddress".tr,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  if (controller.address.isEmpty)
                                    MaterialButton(
                                        minWidth: Get.width,
                                        color: AppColor.primaryColor,
                                        textColor: AppColor.white,
                                        onPressed: () {
                                        },
                                        child: const Text(
                                            "Please Add Shpping Address")),
                                  const SizedBox(height: 12),
                                  ...List.generate(
                                    controller.address.length,
                                    (index) => InkWell(
                                      onTap: () {
                                        controller.chooseShippingAddresss(
                                            controller
                                                .address[index].addressId!);
                                      },
                                      child: CardAddressCheckOut(
                                          title:
                                              "${controller.address[index].addressName}",
                                          body:
                                              "${controller.address[index].addressStreet}",
                                          isActive: controller.addressId ==
                                                  controller
                                                      .address[index].addressId
                                              ? true
                                              : false),
                                    ),
                                  )
                                ],
                              )
                            : const Text("")
                      ],
                    ),
                  ),
                )));
  }
}
