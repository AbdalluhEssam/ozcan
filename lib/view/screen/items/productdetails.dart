import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:ozcan/controller/home/productdetalis_controller.dart';
import 'package:ozcan/core/class/handlingdataview.dart';
import 'package:ozcan/core/constant/color.dart';
import 'package:ozcan/core/constant/routes.dart';
import '../../../Constants.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    Color primaryColor = controller.categoriesColor == null
        ? AppColor.primaryColor
        : Color(int.parse(controller.categoriesColor!));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: primaryColor,
      //   foregroundColor: Colors.white,
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //       statusBarColor: primaryColor,
      //       statusBarIconBrightness: Brightness.light),
      //   title: Text("${controller.itemsModel.name}",
      //       style: TextStyle(
      //         color: Colors.white,
      //         fontSize: 18,
      //         fontWeight: FontWeight.bold,
      //       )),
      // ),
      body: SingleChildScrollView(
        child: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Column(
                children: [
                  Container(
                    constraints: BoxConstraints(maxHeight: Get.width * 0.6),
                    color: primaryColor,
                    child: Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        GetBuilder<ProductDetailsControllerImp>(
                          builder: (controller) => Visibility(
                            replacement: Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return CachedNetworkImage(
                                  alignment: Alignment.center,
                                  imageUrl:
                                      '${controller.itemsModel.images?[index].image}',
                                  fit: BoxFit.cover,
                                  width: Get.width,
                                );
                              },
                              itemCount:
                                  controller.itemsModel.images?.length ?? 0,
                              pagination: const SwiperPagination(
                                  alignment: Alignment.bottomCenter),
                              control: SwiperControl(
                                  color: primaryColor,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15)),
                            ),
                            visible: controller.itemsModel.images!.isEmpty,
                            child: Hero(
                                tag: "${controller.itemsModel.id}",
                                child: CachedNetworkImage(
                                  imageUrl: '${controller.itemsModel.image}',
                                  fit: BoxFit.contain,
                                  width: Get.width,
                                )),
                          ),
                        ),
                        OutlinedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(CircleBorder()),
                                backgroundColor:
                                    MaterialStatePropertyAll(primaryColor)),
                            onPressed: () {
                              SystemChrome.setEnabledSystemUIMode(
                                  SystemUiMode.manual,
                                  overlays: SystemUiOverlay
                                      .values); // to re-show bars
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.itemsModel.name}",
                                  style: Main_font,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffF7F7F7),
                                  ),
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${controller.itemsModel.price}",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        "  شراء",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ],
                                  )),
                                )
                              ],
                            ),
                            LikeButton(
                              isLiked: controller.itemsModel.image
                                  ?.contains(controller.userId.toString()),
                              likeCount: controller.itemsModel.categoryId,
                              countPostion: CountPostion.left,
                              circleColor: CircleColor(
                                  start: Colors.white, end: primaryColor),
                              onTap: (isLiked) {
                                if (controller.userId == "null") {
                                  Get.toNamed(AppRoute.login);
                                }
                                return controller.addLike(
                                  controller.itemsModel.id,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Divider(
                          color: primaryColor,
                          thickness: 1.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "الوصف",
                              style: Main_font,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              controller.itemsModel.description!.replaceAll(
                                RegExp(r'<[^>]*>'),
                                '',
                              ),
                              style: Second_font,
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "تفاصيل المنتج",
                              style: Main_font,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Divider(
                          color: primaryColor,
                          thickness: 1.5,
                        ),
                      ),
                      if (controller.itemsModel.stock!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SizedBox(
                            height: 100,
                            child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    Column(children: [
                                      Text(
                                        "المقاس : ${controller.itemsModel.stock![index].size}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "الكيمة : ${controller.itemsModel.stock![index].qty}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "السعر : ${controller.itemsModel.stock![index].price}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      )
                                    ]),
                                separatorBuilder: (context, index) => Container(
                                      color: primaryColor,
                                      width: 3,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                    ),
                                itemCount:
                                    controller.itemsModel.stock?.length ?? 0),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "اللون : ${controller.itemsModel.name}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Divider(
                          color: primaryColor,
                          thickness: 1.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "مجموع الدفع",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.attach_money_outlined,
                                          color: Colors.black,
                                        )),
                                    Text(
                                      "${controller.itemsModel.price}",
                                      style: Main_font1,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: primaryColor),
                              child: MaterialButton(
                                onPressed: () {
                                  if (controller.myServices.sharedPreferences
                                          .getString("username") !=
                                      null) {
                                    Get.toNamed(AppRoute.chatsDetailsScreen,
                                        arguments: {
                                          "categoriesId":
                                              controller.categoriesId,
                                          "adminId": controller.adminId,
                                          "categoriesName":
                                              controller.categoriesName,
                                          "color": primaryColor,
                                          "itemsName":
                                              controller.itemsModel.name,
                                          "ticketId": controller.ticketId,
                                          "itemsImage": controller.containsLink(
                                                  controller.itemsModel.image!)
                                              ? controller.itemsModel.image!
                                              : '${controller.itemsModel.image}'
                                        });
                                  } else {
                                    Get.toNamed(AppRoute.login);
                                  }
                                },
                                child: Text(
                                  "تواصل معنا",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
