import 'package:flutter/material.dart';
import '../Constants.dart';
import 'widget/view/Dun_categories_of_home.dart';

class Dun_categories_of_home extends StatefulWidget {
  const Dun_categories_of_home({super.key});

  @override
  State<Dun_categories_of_home> createState() => _Dun_categories_of_homeState();
}

class _Dun_categories_of_homeState extends State<Dun_categories_of_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Small_space(),
              Dun_categories_of_home_1(
                ontap: () {
                  //Get.to(Projects_pages_home());
                  print("success");
                },
                photo_prodect: 'assets/images/23.png',
                name_prodect: 'حذاء نايك احمر',
                size: '40',
                qunity: '1',
                price_of_prodect: '565.00',
                col: Colors.red,
                color_border: Colors.grey,
              ),
              Small_space(),
              Dun_categories_of_home_1(
                ontap: () {},
                photo_prodect: 'images/23.png',
                name_prodect: 'حذاء نايك احمر',
                size: '40',
                qunity: '1',
                price_of_prodect: '565.00',
                col: Colors.red,
                color_border: Colors.grey,
              ),
              Small_space(),
              Dun_categories_of_home_1(
                ontap: () {},
                photo_prodect: 'images/23.png',
                name_prodect: 'حذاء نايك احمر',
                size: '40',
                qunity: '1',
                price_of_prodect: '565.00',
                col: Colors.red,
                color_border: Colors.grey,
              ),
              Small_space(),
            ],
          ),
        ],
      ),
    );
  }
}
