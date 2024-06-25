import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ozcan/core/class/handlingdataview.dart';
import 'package:story_view/widgets/story_view.dart';
import '../../../controller/home/storiestop_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageassets.dart';
import '../../../core/constant/routes.dart';

class StoriesTopDepartment extends StatelessWidget {
  const StoriesTopDepartment({super.key});

  @override
  Widget build(BuildContext context) {
    StoriesTopControllerImp controller = Get.put(StoriesTopControllerImp());
    Color primaryColor = Color(int.parse(controller.categoriesColor!));

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.backgroundColor,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "اهلا تفضل بسؤالك",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "خدمة العملاء",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      height: 1,
                      color: primaryColor,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                )
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/images/call.png"),
            ),
          ],
        ),
        elevation: 1,
      ),
      body: GetBuilder<StoriesTopControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Column(
            children: [
              controller.story.isNotEmpty
                  ? Expanded(
                flex: 2,
                child: SizedBox(
                  width: Get.width,
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: StoryView(
                      storyItems: [
                        ...List.generate(
                          controller.story.length,
                              (index) {
                            controller.currentIndex = index;
                            controller.itemsName =
                                controller.story[index].note;
                            controller.image =
                                controller.story[index].mediaPath;
                            controller.update();
                            print(controller.currentIndex);
                            if (controller.story[index].mediaType
                                .toString() ==
                                "video") {
                              return controller.videoDurations.isNotEmpty
                                  ? StoryItem.pageVideo(
                                duration: controller.videoDurations[index],
                                "${controller.story[index].mediaPath}",
                                caption: Text(
                                  "${controller.story[index].note}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                controller:
                                controller.storyController,
                              )
                                  : StoryItem.pageVideo(
                                duration: Duration(seconds: 30),
                                "${controller.story[index].mediaPath}",
                                caption: Text(
                                  "${controller.story[index].note}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                controller:
                                controller.storyController,
                              );
                            } else {
                              return StoryItem.pageImage(
                                caption: Text(
                                  "${controller.story[index].note}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                url:
                                "${controller.story[index].mediaPath}",
                                controller: controller.storyController,
                              );
                            }
                          },
                        ),
                      ],
                      controller: controller.storyController,
                      inline: true,
                      repeat: false,
                      indicatorForegroundColor: primaryColor,
                      onComplete: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
              )
                  : Expanded(
                      child: Lottie.asset(AppImageAssets.offline,
                          width: 250, height: 250)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        controller: controller.textController,
                        onTap: () {
                          if (controller.myServices.sharedPreferences.getString("username") != null) {
                            Get.toNamed(AppRoute.chatsDetailsScreen,
                                arguments: {
                                  "color": primaryColor,
                                  "categoriesId": controller.categoriesId,
                                  "itemsName": controller.itemsName,
                                  "itemsImage": controller.image,
                                });
                          } else {
                            Get.toNamed(AppRoute.login);
                          }

                          controller.storyController.pause();
                        },
                        onFieldSubmitted: (value) {
                          controller.storyController.play();
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        toolbarOptions: ToolbarOptions(
                            selectAll: true,
                            copy: true,
                            cut: true,
                            paste: true),
                        enabled: true,
                        focusNode: FocusNode(canRequestFocus: true),
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                            enabled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                strokeAlign: 5,
                                color: Color(0xffA659A9),
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    width: 2,
                                    strokeAlign: 5,
                                    color: Colors.black)),
                            prefixIcon: IconButton(
                                onPressed: () {
                                  controller.textController.clear();
                                },
                                icon: Icon(FontAwesome5.telegram_plane)),
                            focusColor: Color(0xfff7901e),
                            hintText: ("تواصل الان معنا..."),
                            hintStyle: TextStyle(
                              color: Colors.black,
                            )),
                      ),
                    )),
                    SizedBox(
                      width: 15,
                    ),
                    // LikeButton(
                    //   size: 50,
                    //   circleColor: CircleColor(
                    //       start: Color(0xffA659A9), end: Color(0xffA659A9)),
                    //   bubblesColor: BubblesColor(
                    //     dotPrimaryColor: primaryColor,
                    //     dotSecondaryColor: Colors.black,
                    //   ),
                    //   likeBuilder: (bool isLiked) {
                    //     controller.update();
                    //     return Icon(
                    //       isLiked ? Icons.favorite : Icons.favorite_outline,
                    //       color: isLiked ? Color(0xffA659A9) : Colors.black,
                    //       size: 40,
                    //     );
                    //   },
                    //   countPostion: CountPostion.right,
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
