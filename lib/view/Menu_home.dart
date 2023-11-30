// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ozcan/View/Projects_pages_home.dart';
// import 'package:ozcan/view/widget/view/Menu_home.dart';
// import '../Constants.dart';
// import 'Dun_categories_of_home.dart';
// import 'Ozcan_home.dart';
//
// class Menu_home extends StatefulWidget {
//   const Menu_home({super.key});
//
//   @override
//   State<Menu_home> createState() => _Menu_homeState();
// }
//
// class _Menu_homeState extends State<Menu_home>
//     with SingleTickerProviderStateMixin {
//   late TabController _controller;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _controller = TabController(length: 2, vsync: this, initialIndex: 1);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             //Get.to(BottomNav_woman());
//             print("success");
//           },
//           icon: Image(
//             width: MediaQuery.of(context).size.width * 0.07,
//             height: MediaQuery.of(context).size.height * 0.028,
//             image: AssetImage("images/19.png"),
//             fit: BoxFit.contain,
//             color: Colors.black,
//           ),
//         ),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Text(
//               "طلباتي",
//               style: Main_font1,
//             ),
//             IconButton(
//                 onPressed: () {
//                   Get.to(BottomNav_home());
//                   print("success");
//                 },
//                 icon: Icon(Icons.arrow_forward))
//           ],
//         ),
//         bottom: TabBar(
//           indicatorColor: Colors.black,
//           dividerColor: Colors.white,
//           controller: _controller,
//           tabs: [
//             Tab(
//               child: Text(
//                 "مكتملة",
//                 style: Main_font1,
//               ),
//             ),
//             Tab(
//               child: Text(
//                 "غير مكتملة",
//                 style: Main_font1,
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _controller,
//         children: [
//           Dun_categories_of_home(),
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 Small_space(),
//                 Small_space(),
//                 Un_dun_categories_of_home(
//                   photo_prodect: 'images/23.png',
//                   name_prodect: 'حذاء نايك احمر',
//                   size: '40',
//                   qunity: '1',
//                   price_of_prodect: '565.00',
//                   col: Colors.red,
//                   color_border: Colors.grey,
//                 ),
//                 Small_space(),
//                 Un_dun_categories_of_home(
//                   photo_prodect: 'images/23.png',
//                   name_prodect: 'حذاء نايك احمر',
//                   size: '40',
//                   qunity: '1',
//                   price_of_prodect: '565.00',
//                   col: Colors.red,
//                   color_border: Colors.grey,
//                 ),
//                 Small_space(),
//                 Un_dun_categories_of_home(
//                   photo_prodect: 'images/23.png',
//                   name_prodect: 'حذاء نايك احمر',
//                   size: '40',
//                   qunity: '1',
//                   price_of_prodect: '565.00',
//                   col: Colors.red,
//                   color_border: Colors.grey,
//                 ),
//                 Small_space(),
//                 Un_dun_categories_of_home(
//                   photo_prodect: 'images/23.png',
//                   name_prodect: 'حذاء نايك احمر',
//                   size: '40',
//                   qunity: '1',
//                   price_of_prodect: '565.00',
//                   col: Colors.red,
//                   color_border: Colors.grey,
//                 ),
//                 Small_space(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
