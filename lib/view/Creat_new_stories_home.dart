import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ozcan/View/App_image_home.dart';
import 'package:ozcan/View/Ozcan_home.dart';
import 'package:ozcan/view/widget/view/Creat_new_stories_woman.dart';
import '../Constants.dart';

class Creat_new_stories_home extends StatefulWidget {
  const Creat_new_stories_home({super.key});

  @override
  State<Creat_new_stories_home> createState() => _Creat_new_stories_homeState();
}

class _Creat_new_stories_homeState extends State<Creat_new_stories_home> {
  File? image2;

  pickImage(ImageSource source) {
    AppImagePicker_home(source: source).pick(onpick: (File? image) {
      setState(() {
        this.image2 = image;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(BottomNav_home());
            print("success");
          },
          icon: Image(
            width: MediaQuery.of(context).size.width * 0.07,
            height: MediaQuery.of(context).size.height * 0.05,
            image: AssetImage("images/16.png"),
            fit: BoxFit.contain,
            color: Colors.black,
          ),
        ),
        title: Container(
          width: MediaQuery.of(context).size.width * 0.73,
          //color: Colors.pink,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "انشاء قصة جديدة",
                style: Main_font1,
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.83,
                  height: MediaQuery.of(context).size.height * 0.05,
                  //color: Colors.pink,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "اضافة صورة",
                        style: Main_font1,
                      ),
                    ],
                  ),
                ),
              ),
              Small_space(),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffF7F7F7),
                          boxShadow: List.filled(2,
                              BoxShadow(color: Colors.black, blurRadius: 3))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("images/22.png"),
                            fit: BoxFit.contain,
                            width: MediaQuery.of(context).size.width * 0.13,
                            height: MediaQuery.of(context).size.height * 0.08,
                            //color: Colors.white,
                          ),
                          Small_space(),
                          MaterialButton(
                            onPressed: () {
                              pickImage(ImageSource.gallery);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.black,
                              ),
                              child: Center(
                                child: Text(
                                  "اختيار صورة من المعرض",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    if (image2 != null)
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                          // image: DecorationImage(image: AssetImage(AutofillHints.addressCity)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.file(
                          image2!,
                          fit: BoxFit.cover,
                        ),
                      ),
                  ],
                ),
              ),
              Big_space(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.83,
                  height: MediaQuery.of(context).size.height * 0.05,
                  //color: Colors.pink,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "اضافة نص توضيحي",
                        style: Main_font1,
                      ),
                    ],
                  ),
                ),
              ),
              Show_text(
                text: 'ادخل هنا الوصف',
              ),
              Big_space(),
              Big_space(),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black),
                child: Center(
                  child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        "متابعة",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
