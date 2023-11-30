import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/forgetpasswordcontroller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          title: Text(
            "forget".tr,
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: AppColor.gray),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
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
                          CustomTextTitleAuth(title: "check".tr),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextBodyAuth(
                            textBody: "parcheckcode".tr,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          CustomFormAuth(
                            isNamber: false,
                            valid: (val) {
                              return validInput(val!, 5, 40, "email");
                            },
                            mycontroller: controller.email,
                            label: "email".tr,
                            hinttext: "hintemail".tr,
                            iconData: Icons.email_outlined,
                            // mycontroller: ,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButtonAuth(
                              text: "check".tr,
                              onPressed: () {
                                controller.checkEmail();
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
