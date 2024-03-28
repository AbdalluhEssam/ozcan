import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:lottie/lottie.dart';
import 'package:ozcan/controller/home/stories_controller.dart';
import 'package:ozcan/core/class/handlingdataview.dart';
import 'package:ozcan/likeapi.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageassets.dart';
import '../../../core/constant/routes.dart';

class StoriesDepartment extends StatelessWidget {
  const StoriesDepartment({super.key});

  @override
  Widget build(BuildContext context) {
    StoriesDepartmentControllerImp controller =
        Get.put(StoriesDepartmentControllerImp());
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
      body: GetBuilder<StoriesDepartmentControllerImp>(
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
                                      "${AppLink.imageStory}/${controller.story[index].image}";
                                  controller.update();
                                  print(controller.currentIndex);
                                  if (controller.story[index].video
                                          .toString() ==
                                      "0") {
                                    return StoryItem.pageImage(
                                      caption:
                                          Text("${controller.story[index].note}"),
                                      url:
                                          "${AppLink.imageStory}/${controller.story[index].image}",
                                      controller: StoryController(),
                                    );
                                  } else {
                                    return StoryItem.pageVideo(
                                      "${AppLink.imageStory}/${controller.story[index].image}",
                                      caption:
                                          Text("${controller.story[index].note}"),
                                      controller: StoryController(),
                                    );
                                  }
                                },
                              ),
                            ],
                            controller: controller.storyController,
                            inline: true,
                            repeat: false,
                            indicatorForegroundColor: primaryColor,
                            onStoryShow:(storyItem, index) {

                            },
                            onComplete: () {
                              Get.back();
                            },
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: Lottie.asset(AppImageAssets.loading,
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
                          if (controller.myServices.sharedPreferences
                                  .getString("username") !=
                              null) {
                            Get.toNamed(AppRoute.chatsDetailsScreen,
                                arguments: {
                                  "color": primaryColor,
                                  "categoriesId": controller.categoriesId,
                                  "adminId": controller.adminId,
                                  "itemsName": controller.itemsName,
                                  "itemsImage": controller.image,
                                  "ticketId": controller.ticketId,
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
                    controller.story.isNotEmpty?
                      LikeButton(
                        isLiked: controller
                            .story[controller.currentIndex ?? 0].userId
                            ?.contains(controller.userId.toString()),
                        likeCount: int.parse(controller.story[controller.currentIndex ?? 0].count!),
                        countPostion: CountPostion.left,
                        circleColor:
                            CircleColor(start: Colors.white, end: primaryColor),
                        onTap: (isLiked) {
                          print("controller.currentIndex : ${controller.currentIndex}");
                          print("controller.currentIndex : ${controller.story[controller.currentIndex ?? 0].storyId!}");
                          if (controller.userId == "null") {
                            Get.toNamed(AppRoute.login);
                          }
                          return controller.addLike(
                              controller
                                  .story[controller.currentIndex ?? 0].storyId,
                              controller.currentIndex ?? 0);
                        },
                      ) :
                    LikeButton(
                      likeCount: 0,
                      countPostion: CountPostion.left,
                      circleColor:
                      CircleColor(start: Colors.white, end: primaryColor),
                      onTap: (isLiked) {
                        print(
                            "controller.currentIndex : ${controller.currentIndex}");
                        if (controller.userId == "null") {
                          Get.toNamed(AppRoute.login);
                        }
                        return controller.addLike(
                            controller
                                .story[controller.currentIndex ?? 0].storyId,
                            controller.currentIndex ?? 0);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
