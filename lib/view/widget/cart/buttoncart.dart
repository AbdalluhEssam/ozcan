import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonCart extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomButtonCart({Key? key, this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 9,horizontal: 100),
        color: AppColor.primaryColor,
        textColor: AppColor.backgroundColor,
        onPressed: onPressed,
        child: Text(text,style:const TextStyle(fontWeight: FontWeight.bold,color: AppColor.backgroundColor,fontSize: 17),),
      ),
    );
  }
}
