import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      height: 40,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50)
      ),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 2),
        onPressed: () {
          controller.next();
        },
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text("continue".tr),
      ),
    );
  }
}
