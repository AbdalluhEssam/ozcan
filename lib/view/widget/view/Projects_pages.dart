import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../../Constants.dart';

class Descripation_and_containt_of_prodect extends StatelessWidget {
  final void Function()? ontap_prodect_details;
  final void Function()? ontap_to_make_order;
  final String name_of_prodect;
  final String value_of_buy;
  final String number_of_star;
  final String containt_of_descripation;
  final String price_of_project;
  final Color primaryColor;
  final String size;
  final String color;

  const Descripation_and_containt_of_prodect(
      {super.key,
      required this.name_of_prodect,
      required this.value_of_buy,
      required this.number_of_star,
      required this.containt_of_descripation,
      required this.price_of_project,
      this.ontap_prodect_details,
      required this.primaryColor,
      required this.size,
      required this.color,
      this.ontap_to_make_order});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$name_of_prodect",
                    style: Main_font,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffF7F7F7),
                    ),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$value_of_buy",
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        Text(
                          "  شراء",
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ],
                    )),
                  )
                ],
              ),
              LikeButton(
                size: 50,
                circleColor:
                    CircleColor(start: Color(0xffA659A9), end: primaryColor),
                bubblesColor: BubblesColor(
                  dotPrimaryColor: Color(0xffA659A9),
                  dotSecondaryColor: Colors.black,
                ),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.favorite_outline,
                    color: isLiked ? primaryColor : Colors.black,
                    size: 30,
                  );
                },
                countPostion: CountPostion.left,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Divider(
            color: primaryColor,
            thickness: 1.5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "الوصف",
                style: Main_font,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "$containt_of_descripation",
                  style: Second_font,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "تفاصيل المنتج",
                style: Main_font,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Divider(
            color: primaryColor,
            thickness: 1.5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "المقاس : $size",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "اللون : $color",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Divider(
            color: primaryColor,
            thickness: 1.5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "مجموع الدفع",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.attach_money_outlined,
                            color: Colors.black,
                          )),
                      Text(
                        "$price_of_project",
                        style: Main_font1,
                      ),
                    ],
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: primaryColor),
                child: MaterialButton(
                  onPressed: ontap_to_make_order,
                  child: Text(
                    "تواصل معنا",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
