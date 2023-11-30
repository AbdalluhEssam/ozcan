import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Department extends StatelessWidget {
  final void Function()? onTap;
  final String photo;

  const Department({super.key, this.onTap, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: onTap,
        child: Image(
          width: Get.width,
          height: Get.width*0.4,
          image: CachedNetworkImageProvider(photo),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
