import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
class CustomItemsCartList extends StatelessWidget {
  final String imageUrl;
  final String itemText;
  final String price;
  final String count;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomItemsCartList({Key? key, required this.imageUrl, required this.itemText, required this.price, required this.count, this.onAdd, this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: AppColor.primaryColor.withOpacity(0.2),
          boxShadow: [BoxShadow(offset: Offset.fromDirection(10, 10))]),
      child: Card(
        color: AppColor.black.withOpacity(0.5),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  height: Get.width * 0.27,
                  fit: BoxFit.cover,
                )),
             Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(
                    itemText,
                    style: const TextStyle(
                        color: AppColor.backgroundColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    price,
                    style:const TextStyle(
                        color: AppColor.backgroundColor, fontSize: 16),
                  ),
                )),
            Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 35,
                      child: IconButton(
                          onPressed: onAdd,
                          icon: const Icon(
                            Icons.add,
                            color: AppColor.backgroundColor,
                          )),
                    ),
                    SizedBox(
                        height: 30,
                        child: Text(
                          count,
                          style:const TextStyle(fontFamily: "sans"),
                        )),
                    SizedBox(
                        height: 25,
                        child: IconButton(
                            onPressed: onRemove,
                            icon: const Icon(
                              Icons.remove,
                              color: AppColor.backgroundColor,
                            ))),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
