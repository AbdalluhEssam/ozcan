import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ozcan/Constants.dart';
import 'widget/view/Projects_pages_men.dart';

class Projects_pages_men extends StatefulWidget {
  const Projects_pages_men({super.key});

  @override
  State<Projects_pages_men> createState() => _Projects_pages_menState();
}

class _Projects_pages_menState extends State<Projects_pages_men> {
  final List<String> images = [
    'images/25.png',
    'images/25.png',
  ];

  final List<String> places = [
    '25',
    '25',
  ];

  List<Widget> genarateImagesTiles() {
    return images
        .map((element) => ClipRRect(
              child: Image.asset(
                element,
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.45,
                    color: Color(0xff3E5FBE),
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.31,
                        //color: Colors.pink,
                        child: Stack(
                          children: [
                            Center(
                              child: CarouselSlider(
                                  items: genarateImagesTiles(),
                                  options: CarouselOptions(
                                    enlargeCenterPage: true,
                                    autoPlay: true,
                                    reverse: true,
                                    //aspectRatio: 50/12,
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Big_space(),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        //color: Colors.pink,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  print("success");
                                },
                                icon: Icon(Icons.arrow_forward)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Small_space(),
              Descripation_and_containt_of_prodect_men(
                  ontap_to_make_order: () {},
                  ontap_prodect_details: () {},
                  name_of_prodect: "حذاء نايك زووم",
                  value_of_buy: "8.174",
                  number_of_star: "4.9",
                  containt_of_descripation:
                      "لا يتطلب دعم اضافي مقدمة القدم كما يمكن لمعظم المشاة استخدامه واضافة وسادة به لتعطي وظن اكبر اضافي للحصول علي درجة راحة اكثر اثناء المشي وبذلك يخفف من صدمة القدمية والساق",
                  price_of_project: "690.00")
            ],
          ),
        ],
      ),
    );
  }
}
