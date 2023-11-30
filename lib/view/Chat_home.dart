import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/view/widget/view/Baio_user_home.dart';
import 'package:ozcan/View/Ozcan_home.dart';
import 'package:ozcan/view/widget/view/Ozcan_woman.dart';
import '../Constants.dart';
import 'widget/view/Chat_home.dart';

class Chat_home extends StatefulWidget {
  const Chat_home({super.key});

  @override
  State<Chat_home> createState() => _Chat_homeState();
}

class _Chat_homeState extends State<Chat_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(BottomNav_home());
            print("success");
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.2,
          //color: Colors.pink,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                //width: MediaQuery.of(context).size.width * 0.115,
                //height: MediaQuery.of(context).size.height * 0.1,
                //color: Colors.green,
                child: IconButton(
                    onPressed: () {
                      print("success");
                    },
                    icon: Icon(Icons.emoji_flags_outlined)),
              ),
              Container(
                //width: MediaQuery.of(context).size.width * 0.115,
                //height: MediaQuery.of(context).size.height * 0.1,
                //color: Colors.green,
                child: IconButton(
                    onPressed: () {
                      print("success");
                    },
                    icon: Icon(Icons.videocam_outlined)),
              ),
              Container(
                //width: MediaQuery.of(context).size.width * 0.115,
                //height: MediaQuery.of(context).size.height * 0.1,
                //color: Colors.green,
                child: IconButton(
                  onPressed: () {
                    print("success");
                  },
                  icon: Icon(Icons.phone_outlined),
                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      // Container(
                      //   width: MediaQuery.of(context).size.width * 0.09,
                      //   height: MediaQuery.of(context).size.height * 0.05,
                      //   //color: Colors.green,
                      //   child: IconButton(
                      //     onPressed: () {
                      //       print("success");
                      //     },
                      //     icon: Image(
                      //       image: AssetImage("images/6.png"),
                      //       fit: BoxFit.contain,
                      //     ),
                      //   ),
                      // ),
                      Baio_user_home(
                        name_user: 'مرام احمد',
                        Biao_user: 'صباح الخير',
                      ),
                      // Text(
                      //   "صباح الخير",
                      //   style: Second_font,
                      // ),
                    ],
                  ),
                  // Text(
                  //   "مرام محمود",
                  //   style: Third_font,
                  // ),
                ],
              ),
              Spacer(),
              Image_user_chat(
                photo: "images/8.png",
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        reverse: true,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    //color: Colors.pink,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.92,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                //color: Colors.red,
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.92,
                                child: Container(
                                  child: Stack(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.065,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.grey[200],
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons
                                                            .add_circle_outline_rounded,
                                                        color: Colors.black,
                                                        size: 33,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.photo_outlined,
                                                        color: Colors.black,
                                                        size: 33,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.mic_none,
                                                        color: Colors.black,
                                                        size: 33,
                                                      )),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.35,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                    //color: Colors.black,
                                                    child: TextFormField(
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      textAlign: TextAlign.end,
                                                      style: Second_font,
                                                      toolbarOptions:
                                                          ToolbarOptions(
                                                              selectAll: true,
                                                              copy: true,
                                                              cut: true,
                                                              paste: true),
                                                      enabled: true,
                                                      focusNode: FocusNode(
                                                          canRequestFocus:
                                                              true),
                                                      cursorColor: Colors.white,
                                                      cursorHeight: 20,
                                                      cursorWidth: 3,
                                                      decoration:
                                                          InputDecoration(
                                                              enabled: true,
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                              ),
                                                              border: UnderlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color: Colors
                                                                              .black)),
                                                              focusColor:
                                                                  Colors.grey,
                                                              hintText:
                                                                  ("...مراسلة"),
                                                              hintStyle: TextStyle(
                                                                  color: Colors
                                                                      .black)),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(
                                                        Icons.send,
                                                        color: Colors.black,
                                                        size: 28,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.015,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.green,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.825,
                    child: Stack(
                      children: [
                        // Center(
                        //   child: Image(
                        //     //color: Colors.orange,
                        //     image: AssetImage("images/66.jpg"),
                        //     fit: BoxFit.contain,
                        //   ),
                        // ),
                        SingleChildScrollView(
                          reverse: true,
                          child: Column(
                            children: [
                              Container(
                                //color: Colors.red,
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                              ),
                              Message_container_for_Russell_home(
                                text: "صباح الخير اريد ان اطلب اوردر",
                                photo: 'images/8.png',
                              ),
                              Message_container_for_Receive_home(
                                text: "نعم بكل سرور",
                                photo: 'images/30.png',
                              ),
                              Message_container_for_Russell_home(
                                text:
                                    "كنت اريد حذاء نايك الازرق هل متوفر لديكم",
                                photo: 'images/8.png',
                              ),
                              Message_container_for_Receive_home(
                                text: "نعم متوفر",
                                photo: 'images/30.png',
                              ),
                              Message_container_for_Russell_home(
                                text: "حسننا اريد منه قطعتين",
                                photo: 'images/8.png',
                              ),
                              Message_container_for_Receive_home(
                                text: "حسننا نحن سعداء بخدمة حضرتكم",
                                photo: 'images/30.png',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
