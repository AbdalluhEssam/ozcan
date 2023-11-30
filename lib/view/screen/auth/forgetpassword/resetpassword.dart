import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/resetpasswordcontroller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          title: Text(
            "reset".tr,
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: AppColor.gray),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextTitleAuth(title: "newpass".tr),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextBodyAuth(
                            textBody: "newpass2".tr,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          CustomFormAuth(
                            isNamber: false,

                            valid: (val) {
                              return validInput(val!, 6, 40, "password");
                            },
                            mycontroller: controller.password,
                            label: "password".tr,
                            hinttext: "hintpass".tr,
                            iconData: Icons.lock_outline,
                            // mycontroller: ,
                          ),
                          CustomFormAuth(
                            isNamber: false,

                            valid: (val) {
                              return validInput(val!, 6, 40, "password");
                            },
                            mycontroller: controller.repassword,
                            label: "repassword".tr,
                            hinttext: "rehintpass".tr,
                            iconData: Icons.lock_outline,
                            // mycontroller: ,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButtonAuth(
                              text: "save".tr,
                              onPressed: () {
                                controller.goToSuccessResetPassword();
                              }),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
