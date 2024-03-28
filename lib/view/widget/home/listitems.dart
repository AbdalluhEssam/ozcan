import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/controller/home/home_controller.dart';
import 'package:ozcan/data/model/itemsmodel.dart';
import '../../../core/constant/color.dart';

class ItemsView extends GetView<HomeControllerImp> {
  const ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.17,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.images.length,
        itemBuilder: ((context, index) => ListItemsView(
            itemsModel: ItemsModel.fromJson(controller.images[index]))),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 5,
        ),
      ),
    );
  }
}

class ItemsViewTopSelling extends GetView<HomeControllerImp> {
  const ItemsViewTopSelling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.17,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.itemsTopSelling.length,
        itemBuilder: ((context, index) => ListItemsView(
            itemsModel:
                ItemsModel.fromJson(controller.itemsTopSelling[index]))),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 5,
        ),
      ),
    );
  }
}

class ListItemsView extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;

  const ListItemsView({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToProductDetails(itemsModel);
      },
      child: Card(
        color: AppColor.backgroundColor.withOpacity(0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 10),
              child: Text(
                itemsModel.name.toString(),
                style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: CachedNetworkImage(
                  imageUrl: "${itemsModel.image}",
                  width: Get.width * 0.35,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
