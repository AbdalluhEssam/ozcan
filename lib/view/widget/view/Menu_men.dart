import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/Constants.dart';
import 'Ozcan_woman.dart';

class Un_dun_categories_of_men extends StatelessWidget {
  final void Function()? container_of_prodect;
  final void Function()? basket;
  final void Function()? prodect_photo;
  final String photo_prodect;
  final String name_prodect;
  final String size;
  final String qunity;
  final String price_of_prodect;
  final Color col;
  final Color color_border;

  const Un_dun_categories_of_men(
      {super.key,
      this.basket,
      required this.photo_prodect,
      required this.name_prodect,
      required this.size,
      required this.qunity,
      required this.price_of_prodect,
      required this.col,
      required this.color_border,
      this.container_of_prodect,
      this.prodect_photo});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {},
        child: Container(
          width: MediaQuery.of(context).size.width * 0.92,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: List.filled(
              2,
              BoxShadow(color: color_border, blurRadius: 3),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: MaterialButton(
              onPressed: container_of_prodect,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.07,
                          //color: Colors.pink,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.14,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                //color: Colors.green,
                                child: IconButton(
                                  onPressed: basket,
                                  icon: Image(
                                    image: AssetImage("images/24.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: MediaQuery.of(context).size.height * 0.03,
                                //color: Colors.red,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    "$name_prodect",
                                    style: Second_font,
                                  ),
                                ),
                              ),
                              // Text(
                              //   "$name_prodect",
                              //   style: Second_font,
                              // )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "$qunity",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Text(
                              " = الكمية ",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.005,
                              height: MediaQuery.of(context).size.height * 0.02,
                              color: Colors.grey,
                            ),
                            Text(
                              " $size ",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Text(
                              " = المقاس ",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.005,
                              height: MediaQuery.of(context).size.height * 0.02,
                              color: Colors.grey,
                            ),
                            Text(
                              " اللون ",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Icon(
                              Icons.circle,
                              color: col,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.attach_money_rounded,
                              color: Colors.black,
                            ),
                            Text(
                              "$price_of_prodect",
                              style: Main_font1,
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.26,
                      height: MediaQuery.of(context).size.height * 0.13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffECECEC),
                      ),
                      child: Center(
                        child: MaterialButton(
                          onPressed: prodect_photo,
                          child: Image(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.11,
                            image: AssetImage(photo_prodect),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}

class Delete_prodects_men extends StatelessWidget {
  final void Function()? ontap;
  final String photo_prodect;
  final String name_prodect;
  final String size;
  final String qunity;
  final String price_of_prodect;
  final Color col;
  final Color color_border;

  const Delete_prodects_men(
      {super.key,
      this.ontap,
      required this.photo_prodect,
      required this.name_prodect,
      required this.size,
      required this.qunity,
      required this.price_of_prodect,
      required this.col,
      required this.color_border});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        //color: Colors.pink
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "الحذف من الطلبات ؟",
            style: Main_font2_men,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Divider(
              color: Color(0xff3E5FBE),
              thickness: 2,
            ),
          ),
          Small_space(),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.86,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: List.filled(
                    2,
                    BoxShadow(color: color_border, blurRadius: 2),
                  )),
              child: MaterialButton(
                onPressed: () {},
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.07,
                            //color: Colors.pink,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icons_images1(
                                  photo: 'images/24.png',
                                  ontap: () {},
                                  col1: Colors.black,
                                  col2: Colors.amber,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  height: MediaQuery.of(context).size.height * 0.03,
                                  //color: Colors.red,
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      "$name_prodect",
                                      style: Second_font,
                                    ),
                                  ),
                                ),
                                // Text(
                                //   "$name_prodect",
                                //   style: Second_font,
                                // )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "$qunity",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              Text(
                                " = الكمية ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.005,
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                                color: Colors.grey,
                              ),
                              Text(
                                " $size ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              Text(
                                " = المقاس ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.005,
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                                color: Colors.grey,
                              ),
                              Text(
                                " اللون ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              Icon(
                                Icons.circle,
                                color: col,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.attach_money_rounded),
                              Text(
                                "$price_of_prodect",
                                style: Main_font1,
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.26,
                        height: MediaQuery.of(context).size.height * 0.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffECECEC),
                        ),
                        child: Center(
                          child: Image(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.11,
                            image: AssetImage(photo_prodect),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          // Un_dun_categories_of_woman(
          //   ontap: () {},
          //   photo_prodect: 'images/23.png',
          //   name_prodect: 'حذاء نايك احمر',
          //   size: '40',
          //   qunity: '1',
          //   price_of_prodect: '565.00',
          //   col: Colors.red,
          //   color_border: Color(0xffA659A9),
          // ),
          Small_space(),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffECECEC)),
                  child: MaterialButton(
                    onPressed: () {
                      print("success");
                    },
                    child: Text(
                      "الغاء",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.height * 0.06,
                  //color: Colors.pink,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff3E5FBE)),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "صحيح",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
