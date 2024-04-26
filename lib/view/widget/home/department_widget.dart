import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants.dart';

class StoresWidget extends StatelessWidget {
  final void Function()? onTap;
  final String photo;
  final String title;
  final Color primaryColor;

  const StoresWidget({
    super.key,
    this.onTap,
    required this.photo,
    required this.primaryColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 32,
            backgroundColor: primaryColor,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(3),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: CircleAvatar(
                radius: 30,
                child: CachedNetworkImage(
                  imageUrl: photo,
                  width: Get.width,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Text(
          title,
          style: Third_font_home,
        ),
      ],
    );
  }
}

class StoresWidgetAfter extends StatelessWidget {
  final void Function()? onTap;
  final String photo;
  final bool show;
  final Color primaryColor;

  const StoresWidgetAfter({
    super.key,
    this.onTap,
    required this.photo,
    required this.primaryColor,
    required this.show,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 32,
            backgroundColor: show == false ? Colors.transparent : primaryColor,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(3),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: CircleAvatar(
                radius: 30,
                child: CachedNetworkImage(
                  imageUrl: photo,
                  width: Get.width,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Text(
          "ستوري",
          style: Third_font_home,
        ),
      ],
    );
  }
}
