import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ozcan/Constants.dart';
import 'package:ozcan/controller/home/productdetalis_controller.dart';
import 'package:ozcan/core/constant/color.dart';
import 'package:ozcan/view/widget/view/Projects_pages.dart';

import '../../../likeapi.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {

    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    Color primaryColor = Color(int.parse("0xff" + controller.categoriesColor!));

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
                child: Hero(
                    tag: "${controller.itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          '${AppLink.imageItems}/${controller.itemsModel.itemsImage}',
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width * 0.8,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Descripation_and_containt_of_prodect(
                primaryColor: primaryColor,
                  ontap_prodect_details: () {},
                  ontap_to_make_order: () {},
                  name_of_prodect: "${controller.itemsModel.itemsName}",
                  value_of_buy: "${controller.itemsModel.itemsCount}",
                  number_of_star: "${controller.itemsModel.itemsCount}",
                  containt_of_descripation:
                      "${controller.itemsModel.itemsDesc}",
                  price_of_project: "${controller.itemsModel.itemsPrice}")
            ],
          ),
        ),
      ),
    );
  }
}
