import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
class TopCardCart extends StatelessWidget {
  final String text;
  const TopCardCart({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           Container(
      padding:const EdgeInsets.only(bottom: 5),
      margin:const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: AppColor.primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20)),
      child:  Text(text,textAlign: TextAlign.center,style:const TextStyle(color: AppColor.primaryColor),),
    );
  }
}
