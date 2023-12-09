import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:ozcan/controller/home/department_controller.dart';
import 'package:ozcan/core/class/handlingdataview.dart';
import '../../../core/constant/routes.dart';
import '../../../likeapi.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DepartmentControllerImp controller= Get.put(DepartmentControllerImp());
    Color primaryColor = Color(int.parse("0xff" + controller.categoriesColor!));

    return Scaffold(
      appBar: AppBar(
        title: Text("تصفح المنتجات",style: TextStyle(color: primaryColor),),
        foregroundColor: primaryColor,
      ),
      body: GetBuilder<DepartmentControllerImp>(
        builder: (controller) => HandlingDataViewNot(
          statusRequest: controller.statusRequest,
          widget: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.all(15),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Get.toNamed(AppRoute.productDetails,
                    arguments: {
                  "itemsModel": controller.items[index],
                   "color" : controller.categoriesColor,
                   "categoriesId":controller.categoriesId,
                   "adminId" : controller.adminId,
                   "categoriesName" : controller.categoriesName,
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
                                  .copyWith(fontWeight: FontWeight.bold,color: primaryColor),
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
                      Hero(
                          tag: "${controller.items[index].itemsId}",
                          child: Container(
                            height: Get.width * 0.9,
                            decoration: BoxDecoration(
                              color: Color(0xffECECEC),
                              image: DecorationImage(
                                alignment: Alignment.center,
                                image: CachedNetworkImageProvider(
                                  '${AppLink.imageItems}/${controller.items[index].itemsImage}',
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                          )),
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
                                  if(controller.myServices.sharedPreferences.getString("username") != null){

                                    Get.toNamed(AppRoute.chatsDetailsScreen,arguments: {
                                      "color": primaryColor,
                                      "categoriesId": controller.categoriesId,
                                      "adminId": controller.adminId,
                                      "categoriesName": controller.categoriesName,
                                      "itemsName": controller.items[index].itemsName

                                    });
                                  }else{
                                    Get.toNamed(AppRoute.login
                                       );
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
                                  onPressed: () {},
                                  icon: Icon(Icons.link),
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    // Share.share('check out our product $url');
                                  },
                                  icon: Icon(Icons.share),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.comment),
                                ),
                              ],
                            ),
                            Text(
                              "${controller.items[index].itemsName}",
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
            ),
            itemCount: controller.items.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 10,
            ),
          ),
        ),
      ),
    );
  }
}
