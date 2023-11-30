import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/my_flutter_app_icons.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/logoauth.dart';
import '../../widget/auth/textsignup.dart';
import '../home/personinformation.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "signin".tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: GetBuilder<LoginControllerImp>(
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
                          height: 10,
                        ),
                        const LogoAuth(),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextTitleAuth(title: "welcome".tr),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextBodyAuth(
                          textBody: "par".tr,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomFormAuth(
                          isNamber: false,

                          valid: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                          mycontroller: controller.email,
                          label: "email".tr,
                          hinttext: "hintemail".tr,
                          iconData: Icons.email_outlined,
                          // mycontroller: ,
                        ),
                        GetBuilder<LoginControllerImp>(
                          builder: (controller) => CustomFormAuth(
                            isNamber: false,
                            onTap: () {
                              controller.showPassword();
                            },
                            obscureText: controller.isShowPassword,

                            valid: (val) {
                              return validInput(val!, 5, 40, "password");
                            },
                            mycontroller: controller.password,
                            label: "password".tr,
                            hinttext: "hintpass".tr,
                            iconData: Icons.lock_outline,
                            // mycontroller: ,
                          ),
                        ),
                        InkWell(
                          child: Text(
                            "forget".tr,
                            textAlign: TextAlign.end,
                            style: const TextStyle(color: AppColor.gray),
                          ),
                          onTap: () {
                            controller.goToForgetPassword();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButtonAuth(
                            text: "signin".tr,
                            onPressed: () {
                              controller.login();
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextSignUpOrIn(
                          text1: "have".tr,
                          text2: "signup".tr,
                          onTap: () {
                            controller.goToSignUp();
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildMedia(
                                icon: Icons.facebook,
                                text: "Facebook",
                                onPressed: () async {
                                  await controller.loginFacebook();
                                }),
                            buildMedia(
                                icon: MyFlutterApp.google,
                                text: "Google",
                                onPressed: () {}),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
