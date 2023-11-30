import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/controller/cart/cart_controller.dart';
import 'package:ozcan/view/widget/cart/custombuttoncupon.dart';

import '../../../core/constant/color.dart';
import 'buttoncart.dart';

class BottomNavgationBarCart extends StatelessWidget {
  final void Function()? onDone;
  final String price;
  final String delivery;
  final String totalPrice;
  final TextEditingController myControllerCoupon;
  final void Function()? onPressed;

  const BottomNavgationBarCart(
      {Key? key,
      this.onDone,
      required this.price,
      required this.delivery,
      required this.totalPrice,
      required this.myControllerCoupon,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GetBuilder<CartControllerImp>(
              builder: (controller) => controller.couponName == null
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              cursorColor: AppColor.primaryColor,
                              style:
                                  const TextStyle(color: AppColor.primaryColor),
                              controller: myControllerCoupon,
                              decoration: InputDecoration(
                                isDense: true,
                                fillColor: AppColor.primaryColor,
                                focusColor: AppColor.primaryColor,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8),
                                labelStyle: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                                hintStyle: const TextStyle(
                                    color: AppColor.backgroundColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor, width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor, width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                disabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.primaryColor, width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                hintText: "entercoupon".tr,
                                helperStyle: const TextStyle(fontSize: 14),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                label: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text("entercoupon".tr)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Expanded(
                              flex: 1,
                              child: CustomButtonCoupon(
                                text: "apply".tr,
                                onPressed: onPressed,
                              ))
                        ],
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Text(
                            "couponName".tr,
                            style: const TextStyle(
                                color: AppColor.primaryColor, fontSize: 16),
                          ),
                          Text("${controller.couponName}",
                              style: const TextStyle(
                                  color: AppColor.primaryColor, fontSize: 16))
                        ],
                      ),
                    ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.primaryColor, width: 1)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "price".tr,
                        style: const TextStyle(
                            fontSize: 16, color: AppColor.backgroundColor),
                      ),
                      Text(
                        price,
                        style: const TextStyle(
                            fontSize: 16, color: AppColor.backgroundColor),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "discount".tr,
                        style: const TextStyle(
                            fontSize: 16, color: AppColor.backgroundColor),
                      ),
                      Text(
                        delivery,
                        style: const TextStyle(
                            fontSize: 16, color: AppColor.backgroundColor),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      thickness: 1,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "total".tr,
                        style: const TextStyle(
                            fontSize: 18,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        totalPrice,
                        style: const TextStyle(
                            fontSize: 16, color: AppColor.primaryColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // const Spacer(),
            CustomButtonCart(
              text: "checkout".tr,
              onPressed: onDone,
            )
          ],
        ),
      ),
    );
  }
}
