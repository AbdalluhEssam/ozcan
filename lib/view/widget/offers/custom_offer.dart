// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ozcan/controller/items/offers_controller.dart';
//
// import '../../../controller/items/favorite_controller.dart';
// import '../../../core/constant/color.dart';
// import '../../../data/model/itemsmodel.dart';
// import '../../../likeapi.dart';
//
// class CustomListItemsOffers extends GetView<OffersControllerImp> {
//   final ItemsModel itemsModel;
//
//   const CustomListItemsOffers({
//     Key? key,
//     required this.itemsModel,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         controller.goToProductDetails(itemsModel);
//       },
//       child: Container(
//         decoration: BoxDecoration(boxShadow: [
//           BoxShadow(
//               blurRadius: 5,
//               spreadRadius: 0,
//               color: AppColor.primaryColor.withOpacity(0.3),
//               offset: const Offset(0, 0))
//         ]),
//         child: Card(
//           color: AppColor.black.withOpacity(0.85),
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
//                           height: Get.height * 0.19,
//                           width: Get.width * 0.42,
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
//                                         fontSize: 12,
//                                         height: 0.9),
//                                   ),
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
//                           init: Get.put(FavoriteController()),
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
//               if (itemsModel.itemsDescount != "0")
//                 Positioned(
//                     top: 12,
//                     left: 6,
//                     child: Image.asset(
//                       "assets/images/dis.png",
//                       width: 50,
//                     ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
