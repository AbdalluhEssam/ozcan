import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:ozcan/core/class/handlingdataview.dart';
import 'package:share/share.dart';
import '../../../controller/items/items_controller.dart';
import '../../../core/constant/routes.dart';
import '../../../likeapi.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    Color primaryColor = Color(int.parse(controller.categoriesColor!));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تصفح المنتجات",
          style: TextStyle(color: primaryColor),
        ),
        foregroundColor: primaryColor,
      ),
      body: GetBuilder<ItemsControllerImp>(
        builder: (controller) => HandlingDataViewNot(
          statusRequest: controller.statusRequest,
          widget: ListView.separated(
            padding: EdgeInsets.all(15),
            physics: BouncingScrollPhysics(),
            controller: controller.scrollController,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(AppRoute.productDetails, arguments: {
                    "itemsModel": controller.items[index],
                    "color": controller.categoriesColor,
                    "categoriesId": controller.categoriesId,
                    "adminId": controller.adminId,
                    "categoriesName": controller.categoriesName,
                    "ticketId": controller.ticketId,
                  });
                },
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffECECEC),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: List.filled(
                            2, BoxShadow(color: Colors.black, blurRadius: 2))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.verified_outlined,
                                color: Colors.blue,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Ozcan ${controller.categoriesName}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                radius: 28,
                                backgroundColor: primaryColor,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(3),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: CircleAvatar(
                                    radius: 25,
                                    child: Image.asset(
                                      "assets/images/call.png",
                                      width: Get.width,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          height: 1,
                        ),
                        Container(
                          constraints: BoxConstraints(maxHeight: Get.width * 0.65),
                          child: Hero(
                              tag: "${controller.items[index].id}",
                              child: CachedNetworkImage(
                                  imageUrl: controller.containsLink(
                                          controller.items[index].image!)
                                      ? controller.items[index].image!
                                      : '${controller.items[index].image}')),
                        ),
                        Container(
                          height: Get.width * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                            ),
                            color: primaryColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "تواصل معنا الان",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (controller.myServices.sharedPreferences
                                            .getString("username") !=
                                        null) {
                                      Get.toNamed(AppRoute.chatsDetailsScreen,
                                          arguments: {
                                            "color": primaryColor,
                                            "categoriesId":
                                                controller.categoriesId,
                                            "adminId": controller.adminId,
                                            "categoriesName":
                                                controller.categoriesName,
                                            "ticketId": controller.ticketId,
                                            "itemsName": controller
                                                .items[index].name,
                                            "itemsImage": controller
                                                    .containsLink(controller
                                                        .items[index]
                                                        .image!)
                                                ? controller
                                                    .items[index].image!
                                                : '${controller.items[index].image}'
                                          });
                                    } else {
                                      Get.toNamed(AppRoute.login);
                                    }
                                  },
                                  icon: Icon(
                                    FontAwesome5.telegram_plane,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      shareContent(
                                          "${controller.items[index].name}",
                                          '${controller.containsLink(controller.items[index].image!) ? controller.items[index].image! : '${controller.items[index].image}'}',
                                          '${controller.items[index].slug}');
                                    },
                                    icon: Icon(Icons.link),
                                  ),

                                  IconButton(
                                    onPressed: () {
                                      // Share.share('check out our product $url');
                                      shareContent(
                                          "${controller.items[index].name}",
                                          '${controller.containsLink(controller.items[index].image!) ? controller.items[index].image! : '${controller.items[index].image}'}',
                                          '${controller.items[index].slug}');
                                    },
                                    icon: Icon(Icons.share),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:10),
                                    child: LikeButton(
                                      likeCount: 50,
                                      countPostion: CountPostion.left,
                                      circleColor: CircleColor(
                                          start: Colors.white, end: primaryColor),
                                      onTap: (isLiked) {
                                        if (controller.userId == "null") {
                                          Get.toNamed(AppRoute.login);
                                        }
                                        return controller.addLike(
                                            controller.items[index].id,
                                            index);
                                      },
                                    ),
                                  )
                                  // IconButton(
                                  //   onPressed: () {},
                                  //   icon: Icon(Icons.comment),
                                  // ),
                                ],
                              ),
                              Text(
                                "${controller.items[index].name}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: controller.items.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 10,
            ),
          ),
        ),
      ),
    );
  }

  shareContent(text, imageUrl, linkUrl) {
    Share.share('$imageUrl\n$text\n$linkUrl');
  }
}
