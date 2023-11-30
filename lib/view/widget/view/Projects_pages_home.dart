import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../../../Constants.dart';

class ProductItems extends StatelessWidget {
  final void Function()? onTapDetails;
  final void Function()? onTapOrder;
  final String nameProduct;
  final String value_of_buy;
  final String numberStar;
  final String description;
  final String priceProject;

  const ProductItems(
      {super.key,
      required this.nameProduct,
      required this.value_of_buy,
      required this.numberStar,
      required this.description,
      required this.priceProject,
      this.onTapDetails,
      this.onTapOrder});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
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
                      "$nameProduct",
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
                                style: Third_font_home,
                              )),
                              Text(
                                "  شراء",
                                style: Third_font_home,
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
                          "$numberStar",
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
                LikeButton(
                  size: 50,
                  circleColor:
                      CircleColor(start: Colors.grey, end: Colors.grey),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.grey,
                    dotSecondaryColor: Colors.black,
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite_outline,
                      color: isLiked ? Colors.grey : Colors.black,
                      size: 30,
                    );
                  },
                  countPostion: CountPostion.left,
                  likeCount: 14,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "$description",
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
                IconButton(
                    onPressed: onTapDetails,
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
                      color: Colors.grey),
                  child: MaterialButton(
                    onPressed: onTapOrder,
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
                          "$priceProject",
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
      ),
    );
  }
}
