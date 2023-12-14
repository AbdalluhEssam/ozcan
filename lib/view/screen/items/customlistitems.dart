// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ozcan/controller/items/favorite_controller.dart';
// import 'package:ozcan/controller/items/items_controller.dart';
// import 'package:ozcan/data/model/itemsmodel.dart';
// import '../../../core/constant/color.dart';
// import '../../../core/functions/translatedordatabase.dart';
// import '../../../likeapi.dart';
//
// class CustomListItems extends GetView<ItemsControllerImp> {
//   final ItemsModel itemsModel;
//   final bool active;
//
//   const CustomListItems({
//     Key? key,
//     required this.itemsModel,
//     required this.active,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return InkWell(
//       onTap: () {
//         controller.goToProductDetails(itemsModel);
//       },
//       child: Container(
//         // margin:
//         // const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
//         decoration: BoxDecoration(boxShadow: [
//           BoxShadow(
//               blurRadius: 10,
//               color: AppColor.primaryColor.withOpacity(0.4),
//               blurStyle: BlurStyle.inner,
//               offset: const Offset(0, 0))
//         ]),
//         child: Card(
//           // elevation: 1,
//           color: AppColor.black.withOpacity(0.8),
//           child: Stack(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 0, bottom: 5, left: 10, right: 10),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Hero(
//                         tag: "${itemsModel.itemsId}",
//                         child: CachedNetworkImage(
//                           imageUrl:
//                               "${AppLink.imageItems}/${itemsModel.itemsImage}",
//                           height: size.height * 0.19,
//                           width: size.width * 0.42,
//                           // fit: BoxFit.fill,
//                         )),
//                     Text(
//                       itemsModel.itemsName.toString(),
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 15),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Rating 3.5",
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: AppColor.backgroundColor.withOpacity(0.7),
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         Container(
//                             alignment: Alignment.bottomCenter,
//                             height: 22,
//                             child: Row(
//                               children: [
//                                 ...List.generate(
//                                     5,
//                                     (index) => Icon(
//                                           Icons.star,
//                                           size: 15,
//                                           color: Colors.yellow.withOpacity(0.7),
//                                         )),
//                               ],
//                             ))
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         itemsModel.itemsDescount != "0"
//                             ? Column(
//                                 children: [
//                                   Text(
//                                     "${itemsModel.itemsPriceDiscount} EG",
//                                     style: const TextStyle(
//                                         color: AppColor.primaryColor,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16),
//                                   ),
//                                   Text(
//                                     "${itemsModel.itemsPrice} EG",
//                                     style: const TextStyle(
//                                         decoration: TextDecoration.lineThrough,
//                                         color: AppColor.primaryColor,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 12,height: 0.9),
//                                   ),
//
//                                 ],
//                               )
//                             : Text(
//                                 "${itemsModel.itemsPrice} EG",
//                                 style: const TextStyle(
//                                     color: AppColor.primaryColor,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16),
//                               ),
//                         GetBuilder<FavoriteController>(
//                           builder: (controller) => IconButton(
//                               onPressed: () {
//                                 if (controller.isFavorite[itemsModel.itemsId] ==
//                                     "1") {
//                                   controller.setFavorite(
//                                       itemsModel.itemsId, "0");
//                                   controller
//                                       .deleteFavorite(itemsModel.itemsId!);
//                                 } else {
//                                   controller.setFavorite(
//                                       itemsModel.itemsId, "1");
//                                   controller.addFavorite(itemsModel.itemsId!);
//                                 }
//                               },
//                               icon: Icon(
//                                 controller.isFavorite[itemsModel.itemsId] == "1"
//                                     ? Icons.favorite
//                                     : Icons.favorite_border_outlined,
//                                 color: AppColor.primaryColor,
//                               )),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               if(itemsModel.itemsDescount !="0")
//                 Positioned(
//                   top: 12,
//                   left: 6,
//                   child: Image.asset(
//                     "assets/images/dis.png",
//                     width: 50,
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
