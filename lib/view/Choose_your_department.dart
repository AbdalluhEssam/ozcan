// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ozcan/Constants.dart';
// import 'package:ozcan/View/Welcome_1.dart';
// import 'package:ozcan/view/widget/view/Choose_your_department.dart';
// import 'Ozcan_home.dart';
// class Choose_your_department extends StatefulWidget {
//   const Choose_your_department({super.key});
//
//   @override
//   State<Choose_your_department> createState() => _Choose_your_departmentState();
// }
//
// class _Choose_your_departmentState extends State<Choose_your_department> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//             onPressed: () {
//               Get.to(BottomNav());
//               print("success");
//             },
//             icon: Icon(Icons.arrow_back)),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(left: 15, right: 15),
//             child: Text(
//               "اختيار القسم الخاص بك",
//               style: Main_font,
//             ),
//           ),
//         ],
//       ),
//       body: ListView(
//         children: [
//           Column(
//             children: [
//               Small_space(),
//               Department(
//                   photo: 'images/4.png',
//                   ontap: () {
//                     print("success");
//                   }),
//               Small_space(),
//               Department(
//                   photo: 'images/3.png',
//                   ontap: () {
//                     print("success");
//                   }),
//               Small_space(),
//               Department(
//                   photo: 'images/2.png',
//                   ontap: () {
//                     Get.to(BottomNav_home());
//                     print("success");
//                   }),
//               Small_space(),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
