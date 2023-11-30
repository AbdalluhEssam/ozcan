import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:ozcan/controller/home/department_controller.dart';
import 'package:ozcan/core/constant/color.dart';
import 'package:ozcan/core/constant/routes.dart';
import 'package:ozcan/data/model/itemsmodel.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../likeapi.dart';
import '../../widget/home/department_widget.dart';
import '../home/searchscreen.dart';

class DepartmentView extends StatelessWidget {
  const DepartmentView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DepartmentControllerImp());
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          titleSpacing: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColor.backgroundColor,
          ),
          title: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/call.png"),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "اهلا تفضل بسؤالك",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "خدمة العملاء",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        height: 1,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  )
                ],
              )
            ],
          ),
          elevation: 1,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
          ],
        ),
        body: GetBuilder<DepartmentControllerImp>(
            builder: (controller) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: ListView(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      GetBuilder<DepartmentControllerImp>(
                        builder: (controller) => HandlingDataView(
                            statusRequest: controller.statusRequest,
                            widget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      StoresWidgetAfter(
                                        photo: "assets/images/call.png",
                                        onTap: () {
                                          if (controller.story.isNotEmpty)
                                            Get.toNamed(
                                                AppRoute.storiesDepartment,
                                                arguments: {
                                                  "categoriesId":
                                                      controller.categoriesId
                                                });
                                        },
                                        show: controller.story.isNotEmpty,
                                      ),
                                      if (controller.departmentStory.isNotEmpty)
                                        ...List.generate(
                                          controller.departmentStory.length,
                                          (index) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: StoresWidget(
                                                title:
                                                    "${controller.departmentStory[index]['title']}",
                                                photo:
                                                    "${AppLink.imageStory}/${controller.departmentStory[index]['image']}"),
                                          ),
                                        ),
                                      if (controller.departmentStory.isEmpty)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8, bottom: 20),
                                          child: CircleAvatar(
                                            radius: 32,
                                            backgroundColor: Colors.grey,
                                            child: Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.all(3),
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle),
                                              child: CircleAvatar(
                                                radius: 30,
                                                child: Text("لا يوجد"),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 50,
                                  child: TextFormField(
                                    textAlignVertical: TextAlignVertical.center,
                                    onTap: () {
                                      showSearch(
                                          context: context,
                                          delegate: SearchScreen());
                                    },
                                    // keyboardType: TextInputType.none,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        isDense: true,
                                        prefixIcon:
                                            const Icon(Icons.search, size: 25),
                                        hintText: "findproduct".tr,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        filled: true,
                                        fillColor: AppColor.primaryColor
                                            .withOpacity(0.5)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                if (controller.banner.isNotEmpty)
                                  CarouselSlider(
                                      items: controller.banner.map((imageUrl) {
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: CachedNetworkImage(
                                              imageUrl:
                                                  "${AppLink.imageBanner}/${imageUrl['banner_image']}",
                                              width: double.infinity,
                                              fit: BoxFit.fill),
                                        );
                                      }).toList(),
                                      options: CarouselOptions(
                                        viewportFraction: 1,
                                        aspectRatio: 2.0,
                                        initialPage: 2,
                                        height: Get.height * 0.24,
                                        enableInfiniteScroll: true,
                                        reverse: false,
                                        autoPlay: true,
                                        autoPlayInterval:
                                            const Duration(seconds: 3),
                                        autoPlayAnimationDuration:
                                            const Duration(milliseconds: 800),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        enlargeCenterPage: true,
                                        scrollDirection: Axis.horizontal,
                                        onPageChanged: (index, _) {
                                          controller.currentIndex = index;
                                          controller.update();
                                        },
                                      )),
                                // This trailing comma makes auto-formatting nicer for build methods.
                                const SizedBox(
                                  height: 20,
                                ),
                                if (controller.banner.isNotEmpty)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: controller.banner.map((url) {
                                      int index = controller.banner
                                          .lastIndexOf(url)
                                          .toInt();
                                      // print(index);
                                      return AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 800,
                                        ),
                                        width: controller.currentIndex == index
                                            ? 25
                                            : 5,
                                        height: 5,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color:
                                              controller.currentIndex == index
                                                  ? AppColor.primaryColor
                                                  : AppColor.gray,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                const SizedBox(
                                  height: 20,
                                ),
                                if (controller.items.isNotEmpty)
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          Get.toNamed(AppRoute.itemsView,
                                              arguments: {
                                                "itemsModel": controller.items[index]
                                              });
                                        },
                                        child: Container(
                                          width: 150,
                                          height: 150,
                                          alignment: Alignment.center,
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Color(0xffECECEC),
                                          ),
                                          child: Hero(
                                            tag:
                                                "${controller.items[index].itemsId}",
                                            child: CachedNetworkImage(
                                                fit: BoxFit.contain,
                                                imageUrl:
                                                    '${AppLink.imageItems}/${controller.items[index].itemsImage}'),
                                          ),
                                        )),
                                    itemCount: controller.items.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 5,
                                            mainAxisSpacing: 5),
                                  ),
                                SizedBox(
                                  height: 20,
                                ),
                                // if (controller.items.isNotEmpty)
                                //   ListView.separated(
                                //     shrinkWrap: true,
                                //     physics: NeverScrollableScrollPhysics(),
                                //     itemBuilder: (context, index) => InkWell(
                                //       onTap: () {
                                //         Get.toNamed(AppRoute.productDetails,
                                //             arguments: {
                                //               "itemsModel":
                                //                   controller.items[index]
                                //             });
                                //       },
                                //       child: Card(
                                //         child: Container(
                                //           decoration: BoxDecoration(
                                //               color: Color(0xffECECEC),
                                //               borderRadius:
                                //                   BorderRadius.circular(15),
                                //               boxShadow: List.filled(
                                //                   2,
                                //                   BoxShadow(
                                //                       color: Colors.black,
                                //                       blurRadius: 2))),
                                //           child: Column(
                                //             children: [
                                //               Padding(
                                //                 padding:
                                //                     const EdgeInsets.all(5.0),
                                //                 child: Row(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.center,
                                //                   mainAxisAlignment:
                                //                       MainAxisAlignment.end,
                                //                   children: [
                                //                     Icon(
                                //                       Icons.verified_outlined,
                                //                       color: Colors.blue,
                                //                     ),
                                //                     const SizedBox(
                                //                       width: 15,
                                //                     ),
                                //                     Text(
                                //                       "Ozcan ${controller.categoriesName}",
                                //                       style: Theme.of(context)
                                //                           .textTheme
                                //                           .bodyMedium!
                                //                           .copyWith(
                                //                               fontWeight:
                                //                                   FontWeight
                                //                                       .bold),
                                //                     ),
                                //                     const SizedBox(
                                //                       width: 10,
                                //                     ),
                                //                     CircleAvatar(
                                //                       radius: 28,
                                //                       backgroundColor:
                                //                           AppColor.primaryColor,
                                //                       child: Container(
                                //                         alignment:
                                //                             Alignment.center,
                                //                         margin:
                                //                             EdgeInsets.all(3),
                                //                         clipBehavior: Clip
                                //                             .antiAliasWithSaveLayer,
                                //                         decoration:
                                //                             BoxDecoration(
                                //                                 shape: BoxShape
                                //                                     .circle),
                                //                         child: CircleAvatar(
                                //                           radius: 25,
                                //                           child: Image.asset(
                                //                             "assets/images/call.png",
                                //                             width: Get.width,
                                //                             fit: BoxFit.fill,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //               Divider(
                                //                 color: Colors.black,
                                //                 height: 1,
                                //               ),
                                //               Container(
                                //                 height: Get.width * 0.9,
                                //                 decoration: BoxDecoration(
                                //                   color: Color(0xffECECEC),
                                //                   image: DecorationImage(
                                //                       image: CachedNetworkImageProvider(
                                //                           '${AppLink.imageItems}/${controller.items[index].itemsImage}'),
                                //                       fit: BoxFit.fill),
                                //                 ),
                                //               ),
                                //               Container(
                                //                 height: Get.width * 0.12,
                                //                 decoration: BoxDecoration(
                                //                   borderRadius:
                                //                       BorderRadius.only(
                                //                     bottomRight:
                                //                         Radius.circular(0),
                                //                     bottomLeft:
                                //                         Radius.circular(0),
                                //                   ),
                                //                   color: AppColor.primaryColor,
                                //                 ),
                                //                 child: Padding(
                                //                   padding:
                                //                       const EdgeInsets.only(
                                //                           left: 15, right: 15),
                                //                   child: Row(
                                //                     mainAxisAlignment:
                                //                         MainAxisAlignment
                                //                             .spaceBetween,
                                //                     children: [
                                //                       TextButton(
                                //                         onPressed: () {},
                                //                         child: Text(
                                //                           "تواصل معنا الان",
                                //                           style: TextStyle(
                                //                             color: Colors.white,
                                //                             fontWeight:
                                //                                 FontWeight.bold,
                                //                             fontSize: 16,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                       IconButton(
                                //                         onPressed: () {},
                                //                         icon: Icon(
                                //                           FontAwesome5
                                //                               .telegram_plane,
                                //                           color:
                                //                               Colors.blueAccent,
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //               ),
                                //               Container(
                                //                 decoration: BoxDecoration(
                                //                     borderRadius:
                                //                         BorderRadius.only(
                                //                       bottomLeft:
                                //                           Radius.circular(15),
                                //                       bottomRight:
                                //                           Radius.circular(15),
                                //                     ),
                                //                     color: Colors.white),
                                //                 child: Column(
                                //                   children: [
                                //                     Row(
                                //                       children: [
                                //                         IconButton(
                                //                           onPressed: () {},
                                //                           icon:
                                //                               Icon(Icons.link),
                                //                         ),
                                //                         Spacer(),
                                //                         IconButton(
                                //                           onPressed: () {
                                //                             // Share.share('check out our product $url');
                                //                           },
                                //                           icon:
                                //                               Icon(Icons.share),
                                //                         ),
                                //                         IconButton(
                                //                           onPressed: () {},
                                //                           icon: Icon(
                                //                               Icons.comment),
                                //                         ),
                                //                       ],
                                //                     ),
                                //                     Text(
                                //                       "${controller.items[index].itemsName}",
                                //                       style: TextStyle(
                                //                           color: Colors.black,
                                //                           fontWeight:
                                //                               FontWeight.bold,
                                //                           fontSize: 15),
                                //                     ),
                                //                     SizedBox(
                                //                       height: 8,
                                //                     )
                                //                   ],
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //     itemCount: controller.items.length,
                                //     separatorBuilder:
                                //         (BuildContext context, int index) =>
                                //             SizedBox(
                                //       height: 10,
                                //     ),
                                //   ),

                                // ProductItems(
                                //     onTapDetails: () {},
                                //     onTapOrder: () {},
                                //     nameProduct: "حذاء نايك زووم",
                                //     value_of_buy: "8.174",
                                //     numberStar: "4.9",
                                //     description:
                                //         "لا يتطلب دعم اضافي مقدمة القدم كما يمكن لمعظم المشاة استخدامه واضافة وسادة به لتعطي وظن اكبر اضافي للحصول علي درجة راحة اكثر اثناء المشي وبذلك يخفف من صدمة القدمية والساق",
                                //     priceProject: "690.00")
                              ],
                            )),
                      )
                    ]))));
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listData;

  const ListItemsSearch({Key? key, required this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.2),
                boxShadow: [BoxShadow(offset: Offset.fromDirection(10, 10))]),
            margin: const EdgeInsets.symmetric(vertical: 2),
            child: Card(
              color: AppColor.black.withOpacity(0.5),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: Hero(
                      tag: "${listData[index].itemsId}",
                      child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imageItems}/${listData[index].itemsImage}"),
                    )),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(
                            listData[index].itemsName.toString(),
                            style: const TextStyle(
                                color: AppColor.backgroundColor),
                          ),
                          subtitle: Text("${listData[index].itemsPrice}",
                              style: const TextStyle(
                                  color: AppColor.backgroundColor)),
                        )),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
