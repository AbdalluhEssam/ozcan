import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ozcan/controller/home/productdetalis_controller.dart';
import 'package:ozcan/core/constant/color.dart';
import 'package:ozcan/core/constant/routes.dart';
import 'package:ozcan/view/widget/view/Projects_pages.dart';
import '../../../likeapi.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    Color primaryColor = controller.categoriesColor == null
        ? AppColor.primaryColor
        : Color(int.parse("0xff" + controller.categoriesColor!));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
        title: Text("${controller.itemsModel.itemsName}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                alignment: Alignment.center,
                color: primaryColor,
                child: Visibility(
                  replacement: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return CachedNetworkImage(
                        alignment: Alignment.center,
                        imageUrl:
                            '${AppLink.imageItems}/${controller.images[index].image.toString()}',
                        fit: BoxFit.contain,
                      );
                    },
                    itemCount: controller.images.length,
                    pagination: const SwiperPagination(
                        alignment: Alignment.bottomCenter),
                    control: const SwiperControl(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 15)),
                  ),
                  visible: controller.images.isEmpty,
                  child: Hero(
                      tag: "${controller.itemsModel.itemsId}",
                      child: CachedNetworkImage(
                        imageUrl: controller
                                .containsLink(controller.itemsModel.itemsImage!)
                            ? controller.itemsModel.itemsImage!
                            : '${AppLink.imageItems}/${controller.itemsModel.itemsImage}',
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width * 0.8,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Descripation_and_containt_of_prodect(
                primaryColor: primaryColor,
                ontap_prodect_details: () {},
                ontap_to_make_order: () {
                  if (controller.myServices.sharedPreferences
                          .getString("username") !=
                      null) {
                    Get.toNamed(AppRoute.chatsDetailsScreen, arguments: {
                      "categoriesId": controller.categoriesId,
                      "adminId": controller.adminId,
                      "categoriesName": controller.categoriesName,
                      "color": primaryColor,
                      "itemsName": controller.itemsModel.itemsName,
                      "ticketId": controller.ticketId,
                      "itemsImage": controller
                              .containsLink(controller.itemsModel.itemsImage!)
                          ? controller.itemsModel.itemsImage!
                          : '${AppLink.imageItems}/${controller.itemsModel.itemsImage}'
                    });
                  } else {
                    Get.toNamed(AppRoute.login);
                  }
                },
                name_of_prodect: "${controller.itemsModel.itemsName}",
                value_of_buy: "${controller.itemsModel.items_ordered_times}",
                number_of_star: "${controller.itemsModel.itemsCount}",
                containt_of_descripation: "${controller.itemsModel.itemsDesc}",
                price_of_project: "${controller.itemsModel.itemsPrice}",
                size: "${controller.itemsModel.size}",
                color: "${controller.itemsModel.color}",
              )
            ],
          ),
        ),
      ),
    );
  }
}
