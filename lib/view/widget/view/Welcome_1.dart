import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoProdects extends StatelessWidget {
  final String photo_prodect;

  const PhotoProdects({
    super.key,
    required this.photo_prodect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          image: DecorationImage(image: CachedNetworkImageProvider(photo_prodect), fit: BoxFit.fill)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/1.png",
            fit: BoxFit.contain,
            height: Get.width * 0.6,
            width: Get.width * 0.7,
          )
        ],
      ),
    );
  }
}
