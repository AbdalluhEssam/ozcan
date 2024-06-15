import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:ozcan/core/constant/color.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../controller/home/settings_controller.dart';
import '../../../core/constant/my_flutter_app_icons.dart';
import '../../../core/constant/routes.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColor.primaryColor),
      ),
      body: Container(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: Get.width * 0.4,
                  color: AppColor.primaryColor,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/1.png",
                    color: AppColor.black,
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    width: Get.width * 0.8,
                  ),
                ),
                Positioned(
                    top: Get.width * 0.28,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: AppColor.black,
                              borderRadius: BorderRadius.circular(100)),
                          child: const CircleAvatar(
                            radius: 40,
                            backgroundColor: AppColor.backgroundColor,
                            backgroundImage:
                                AssetImage("assets/images/avatar.png"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(controller.myServices.sharedPreferences
                                    .getString("username") !=
                                null
                            ? "${controller.myServices.sharedPreferences.getString("username")}"
                            : "لم يتم تسجيل الدخول!"),
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: Get.width * 0.4,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                color: AppColor.primaryColor.withOpacity(0.8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        "about".tr,
                        style: const TextStyle(color: AppColor.backgroundColor),
                      ),
                      onTap: () {
                        Get.toNamed(AppRoute.aboutUs);
                      },
                      trailing: const Icon(
                        Icons.info_outline,
                        color: AppColor.backgroundColor,
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColor.black,
                    ),
                    ListTile(
                      title: Text(
                        "اتصل بنا".tr,
                        style: const TextStyle(color: AppColor.backgroundColor),
                      ),
                      onTap: () {
                        Get.toNamed(AppRoute.helpPage);
                      },
                      trailing: const Icon(
                        Icons.support_agent_sharp,
                        color: AppColor.backgroundColor,
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColor.black,
                    ),
                    if (controller.myServices.sharedPreferences
                            .getString("username") !=
                        null)
                      ListTile(
                        title: Text(
                          "طلباتك".tr,
                          style:
                              const TextStyle(color: AppColor.backgroundColor),
                        ),
                        onTap: () {
                          Get.toNamed(AppRoute.ordersAll);
                        },
                        trailing: const Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColor.backgroundColor,
                        ),
                      ),
                    const Divider(
                      height: 1,
                      color: AppColor.black,
                    ),
                    controller.myServices.sharedPreferences
                                .getString("username") !=
                            null
                        ? ListTile(
                            title: Text(
                              "logout".tr,
                              style: const TextStyle(
                                  color: AppColor.backgroundColor),
                            ),
                            onTap: () {
                              controller.logout();
                            },
                            trailing: const Icon(
                              Icons.exit_to_app,
                              color: AppColor.backgroundColor,
                            ),
                          )
                        : ListTile(
                            title: Text(
                              "تسجيل الدخول".tr,
                              style: const TextStyle(
                                  color: AppColor.backgroundColor),
                            ),
                            onTap: () {
                              Get.toNamed(AppRoute.login);
                            },
                            trailing: const Icon(
                              Icons.login,
                              color: AppColor.backgroundColor,
                            ),
                          ),
                  ],
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: Get.width * 0.70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildMedia(
                      icon: Icons.facebook,
                      text: "Facebook",
                      onPressed: () {
                        facebook();
                      }),
                  buildMedia(
                      icon: MyFlutterApp.instagram,
                      text: "Instagram",
                      onPressed: () {
                        instagram();
                      }),
                  buildMedia(
                      icon: FontAwesome.whatsapp,
                      text: "Whatsapp",
                      onPressed: () {
                        whatsapp();
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Ozcan | ©2023",
                  style: TextStyle(color: AppColor.white),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

whatsapp() async {
  const url = "whatsapp://send?phone=+9647746423382";
  await launchUrlString(url);
}

facebook() async {
  const url =
      'https://www.facebook.com/profile.php?id=100076236790588&mibextid=ZbWKwL';
  await launchUrlString(url);
}

instagram() async {
  const url = 'https://www.instagram.com/ozcan_women';
  await launchUrlString(url);
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  const color = AppColor.black;
  const hoverColor = AppColor.black;
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: const TextStyle(color: color),
    ),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

Widget buildMedia(
    {required String text,
    required IconData icon,
    void Function()? onPressed}) {
  const color = AppColor.primaryColor;
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        IconButton(
          onPressed: onPressed,
          iconSize: 30,
          icon: Icon(
            icon,
            color: color,
          ),
        ),
        Text(
          text,
          style: const TextStyle(color: AppColor.gray, fontSize: 10),
        ),
      ],
    ),
  );
}
