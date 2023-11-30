import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/verfiycodecontroller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerfiyCodeControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          title: Text(
            "verification".tr,
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: AppColor.gray),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: GetBuilder<VerfiyCodeControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextTitleAuth(title: "checkcode".tr),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextBodyAuth(
                          textBody: "parcheckcode2".tr,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        OtpTextField(
                          cursorColor: AppColor.primaryColor,
                          fieldWidth: 55,
                          borderRadius: BorderRadius.circular(30),
                          numberOfFields: 5,
                          borderColor: AppColor.primaryColor,
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verfiyCodeResetPass) {
                            controller.goToResetPassword(verfiyCodeResetPass);
                          }, // end onSubmit
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
