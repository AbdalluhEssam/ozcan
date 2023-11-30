import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/items/items_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatedordatabase.dart';
import '../../../data/model/categories_model.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: size.height * 0.1,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: ((context, index) {
          return CategoriesHome(
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]));
        }),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 10,
        ),
      ),
    );
  }
}

class CategoriesHome extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;

  const CategoriesHome(
      {Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.changeCat(i, categoriesModel.categoriesId!);
        },
        child: Row(
          children: [
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => Container(
                padding: const EdgeInsets.only(bottom: 5, right: 10, left: 10),
                decoration: controller.selectedCat == i
                    ? const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 3, color: AppColor.primaryColor)))
                    : null,
                child: Text(
                  translateDataBase(categoriesModel.categoriesNameAr.toString(),
                      categoriesModel.categoriesName.toString()),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.gray),
                ),
              ),
            )
          ],
        ));
  }
}
