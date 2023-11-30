import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../../Constants.dart';

class Dun_categories_of_woman_1 extends StatelessWidget {
  final void Function()? ontap;
  final String photo_prodect;
  final String name_prodect;
  final String size;
  final String qunity;
  final String price_of_prodect;
  final Color col;
  final Color color_border;

  const Dun_categories_of_woman_1(
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
          onPressed: ontap,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                      LikeButton(
                        size: 50,
                        circleColor: CircleColor(
                            start: Color(0xffA659A9), end: Color(0xffA659A9)),
                        bubblesColor: BubblesColor(
                          dotPrimaryColor: Color(0xffA659A9),
                          dotSecondaryColor: Colors.black,
                        ),
                        likeBuilder: (bool isLiked) {
                          return Icon(
                            Icons.favorite_outline,
                            color: isLiked ? Color(0xffA659A9) : Colors.black,
                            size: 30,
                          );
                        },
                        countPostion: CountPostion.left,
                        likeCount: 14,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    );
  }
}
