import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/View/Ozcan_home.dart';
import 'package:ozcan/view/widget/view/Call_us.dart';
import 'package:ozcan/view/widget/view/Ozcan_woman.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Constants.dart';

class Call_us_home extends StatefulWidget {
  const Call_us_home({super.key});

  @override
  State<Call_us_home> createState() => _Call_us_homeState();
}

class _Call_us_homeState extends State<Call_us_home> {
  Future<void> _launchURL1(String url) async {
    final Uri uri = Uri.parse(
        'https://www.instagram.com/ozcan_women/?utm_source=ig_web_button_share_sheet&igshid=OGQ5ZDc2ODk2ZA=='); //Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  Future<void> _launchURL2(String url) async {
    final Uri uri = Uri.parse(
        'https://www.instagram.com/ozcan_for_men/?utm_source=ig_web_button_share_sheet&igshid=OGQ5ZDc2ODk2ZA=='); //Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  Future<void> _launchURL3(String url) async {
    final Uri uri = Uri.parse(
        'https://www.instagram.com/ozcan_for_home/?utm_source=ig_web_button_share_sheet&igshid=OGQ5ZDc2ODk2ZA=='); //Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          splashColor: Colors.white,
          onPressed: () {
            Get.to(BottomNav_home());
            print("success");
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text(
              "تابع صفحاتنا لمعرفة المزيد",
              style: Main_font1,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Small_space(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "ozcan woman : الوصف",
                      style: Main_font1,
                    )
                  ],
                ),
              ),
              Small_space(),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      descripation(
                        text: "Clothing (Brand)",
                      ),
                      descripation(
                        text: "Ozcan for shopping",
                      ),
                      descripation(
                        text: "اوزجان للتسوق من تركيا",
                      ),
                      descripation(
                        text:
                            "براندات عالمية و براندات تركيا تسوق من تركيا الى العراق",
                      ),
                      descripation(
                        text: "+905551722217 الادارة",
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                //color: Colors.pink,
                child: GestureDetector(
                    onTap: () {
                      _launchURL1("www.lipsum.com");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image_user(
                          photo: "images/36.jpg",
                          ontap: () {
                            //Get.to(Creat_new_stories());
                            print("success");
                          },
                        ),
                        const Text(
                          "Instagram link for woman",
                          style: Main_font1,
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
              ),
              Small_space(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "ozcan men : الوصف",
                      style: Main_font1,
                    )
                  ],
                ),
              ),
              Small_space(),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      descripation(
                        text: "اوزجان رجالي",
                      ),
                      descripation(
                        text: "Clothing (Brand)",
                      ),
                      descripation(
                        text: "اوزجان رجالي للتسوق من تركيا",
                      ),
                      descripation(
                        text: "Ozcan for shoping",
                      ),
                      descripation(
                        text: "من جميع البراندات العالمية",
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                //color: Colors.pink,
                child: GestureDetector(
                    onTap: () {
                      _launchURL2("www.lipsum.com");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image_user(
                          photo: "images/36.jpg",
                          ontap: () {
                            //Get.to(Creat_new_stories());
                            print("success");
                          },
                        ),
                        const Text(
                          "Instagram link for men",
                          style: Main_font1,
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
              ),
              Small_space(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "ozcan home : الوصف",
                      style: Main_font1,
                    )
                  ],
                ),
              ),
              Small_space(),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      descripation(
                        text: "اوزجان للاثاث المنزلي",
                      ),
                      descripation(
                        text: "Household supplies",
                      ),
                      descripation(
                        text:
                            "بيع وشحن من تركيا اثاث زولية ستائر والمفروشات والاغراض المنزلية ديكور منازل مطابخ حمام لوحات ثريات اطباق زجاجية تحفيات وغيرها.",
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                //color: Colors.pink,
                child: GestureDetector(
                    onTap: () {
                      _launchURL3("www.lipsum.com");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image_user(
                          photo: "images/36.jpg",
                          ontap: () {
                            //Get.to(Creat_new_stories());
                            print("success");
                          },
                        ),
                        const Text(
                          "Instagram link for home",
                          style: Main_font1,
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
              ),
              Small_space(),
            ],
          ),
        ],
      ),
    );
  }
}
