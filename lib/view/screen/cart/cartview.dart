import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/core/constant/routes.dart';
import 'package:ozcan/likeapi.dart';
import 'package:ozcan/view/widget/cart/custom)bottom_navgationbar_cart.dart';
import 'package:ozcan/view/widget/cart/customitemcartlist.dart';
import 'package:ozcan/view/widget/cart/topcardcart.dart';
import '../../../controller/cart/cart_controller.dart';
import '../../../core/class/crud.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatedordatabase.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "cartview".tr,
          ),
        ),
        bottomNavigationBar: GetBuilder<CartControllerImp>(
            init: Get.put(CartControllerImp()),
            builder: (controller) => HandlingDataViewNot(
                statusRequest: controller.statusRequest,
                widget: BottomNavgationBarCart(
                  onPressed: () {
                    controller.checkCoupon();
                  },
                  myControllerCoupon: controller.myControllerCoupon!,
                  price: "${controller.priceOrder} EG",
                  delivery: "${controller.discountCoupon} %",
                  totalPrice: "${controller.getTotalPrice()} EG",
                  onDone: () {
                    controller.goToCheckOut();
                  },
                ))),
        body: GetBuilder<CartControllerImp>(
            init: Get.put(CartControllerImp()),
            builder: (controller) => HandlingDataViewNot(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      TopCardCart(
                        text: translateDataBase(
                            " لديك ${controller.totalCountItems} عناصر في عربتك ",
                            "You Have ${controller.totalCountItems} Items in Your List"),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            ...List.generate(
                              controller.cart.length,
                              (index) => InkWell(
                                onTap: () {
                                  // controller.goToProductDetails(controller.cart[index]);
                                },
                                child: CustomItemsCartList(
                                  imageUrl:
                                      "${AppLink.imageItems}/${controller.cart[index].itemsImage}",
                                  itemText: translateDataBase(
                                      controller.cart[index].itemsNameAr
                                          .toString(),
                                      controller.cart[index].itemsName
                                          .toString()),
                                  price:
                                      "${controller.cart[index].itemsprice} EG",
                                  count: "${controller.cart[index].countitems}",
                                  onAdd: () async {
                                    await controller
                                        .add(controller.cart[index].itemsId!);
                                    controller.refreshPage();
                                  },
                                  onRemove: () async {
                                    await controller.delete(
                                        controller.cart[index].itemsId!);
                                    controller.refreshPage();
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )));
  }
}
