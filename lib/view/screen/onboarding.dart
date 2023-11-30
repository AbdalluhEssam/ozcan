import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/onboarding_controller.dart';
import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/customslider.dart';
import '../widget/onboarding/dotcontroller.dart';

class OnBoarding extends GetView<OnBoardingControllerImp> {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: SafeArea(
          child: InkWell(
              child: Column(
            children: [
              Expanded(flex: 4, child: CustomSliderOnBoarding()),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CustomDotControllerOnBoarding(),
                      Spacer(
                        flex: 2,
                      ),
                      CustomButtonOnBoarding()
                    ],
                  )),
            ],
          )),
        ));
  }
}
