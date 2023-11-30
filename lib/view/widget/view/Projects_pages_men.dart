import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../../../Constants.dart';

class Descripation_and_containt_of_prodect_men extends StatelessWidget {
  final void Function()? ontap_prodect_details;
  final void Function()? ontap_to_make_order;
  final String name_of_prodect;
  final String value_of_buy;
  final String number_of_star;
  final String containt_of_descripation;
  final String price_of_project;

  const Descripation_and_containt_of_prodect_men(
      {super.key,
      required this.name_of_prodect,
      required this.value_of_buy,
      required this.number_of_star,
      required this.containt_of_descripation,
      required this.price_of_project,
      this.ontap_prodect_details,
      this.ontap_to_make_order});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LikeButton(
                size: 50,
                circleColor: CircleColor(
                    start: Color(0xff3E5FBE), end: Color(0xff3E5FBE)),
                bubblesColor: BubblesColor(
                  dotPrimaryColor: Color(0xff3E5FBE),
                  dotSecondaryColor: Colors.black,
                ),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.favorite_outline,
                    color: isLiked ? Color(0xff3E5FBE) : Colors.black,
                    size: 30,
                  );
                },
                countPostion: CountPostion.left,
                likeCount: 14,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$name_of_prodect",
                    style: Main_font,
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffF7F7F7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                              "$value_of_buy",
                              style: Third_font_men,
                            )),
                            Text(
                              "  شراء",
                              style: Third_font_men,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.01,
                        height: MediaQuery.of(context).size.height * 0.02,
                        //color: Colors.grey,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.005,
                        height: MediaQuery.of(context).size.height * 0.02,
                        color: Colors.grey,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.01,
                        height: MediaQuery.of(context).size.height * 0.02,
                        //color: Colors.grey,
                      ),
                      Text(
                        "$number_of_star",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.star_border_purple500_outlined))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Divider(
            color: Colors.grey,
            thickness: 1.5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
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
                  textAlign: TextAlign.end,
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
              IconButton(
                  onPressed: ontap_prodect_details,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: 40,
                  )),
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
            color: Colors.grey,
            thickness: 1.5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff3E5FBE)),
                child: MaterialButton(
                  onPressed: ontap_to_make_order,
                  child: Text(
                    "مواصلة الطلب",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14),
                  ),
                ),
              ),
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
            ],
          ),
        ),
      ],
    );
  }
}
