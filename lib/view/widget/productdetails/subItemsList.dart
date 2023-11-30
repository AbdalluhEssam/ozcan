import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/productdetalis_controller.dart';
import '../../../core/constant/color.dart';

class SubItemsList extends GetView<ProductDetailsControllerImp> {
  const SubItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subItems.length,
              (index) => Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 6),
            margin: const EdgeInsets.only(right: 10),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color:
                controller.subItems[index]['active'] == "1"
                    ? AppColor.primaryColor
                    : AppColor.black,
                borderRadius: BorderRadius.circular(10),
                border:
                Border.all(color: AppColor.secoundColor)),
            child: Text(
              controller.subItems[index]['name'],
              style:
              TextStyle(fontWeight: FontWeight.bold,color: controller.subItems[index]['active'] == "1"?AppColor.backgroundColor:AppColor.primaryColor ),
            ),
          ),
        )
      ],
    );
  }
}
