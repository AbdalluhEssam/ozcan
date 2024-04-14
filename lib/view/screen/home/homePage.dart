import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozcan/likeapi.dart';
import 'package:ozcan/view/screen/home/searchscreen.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/view/Welcome_1.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
    Get.put(HomeControllerImp());
    return Scaffold(
      body: Center(
          child: GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  if (controller.images.isNotEmpty)
                    CarouselSlider.builder(
                      itemBuilder: (context, index, realIndex) {
                        return PhotoProdects(
                          photo_prodect: '${controller.images[index]['image']}',
                        );
                      },
                      options: CarouselOptions(
                        pageViewKey: PageStorageKey<String>('carousel_slider'),
                        scrollPhysics: FixedExtentScrollPhysics(),
                        reverse: false,
                        height: Get.height,
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 4),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.linear,
                        onPageChanged: (index, _) {
                          controller.currentIndex = index;
                          controller.update();
                        },
                        scrollDirection: Axis.vertical,
                      ),
                      itemCount: controller.images.length,
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: SizedBox(
                          height: 50,
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            onTap: () {
                              showSearch(
                                  context: context, delegate: SearchScreen());
                            },
                            // keyboardType: TextInputType.none,
                            readOnly: true,

                            decoration: InputDecoration(
                                isDense: true,
                                prefixIcon: const Icon(Icons.search, size: 25),
                                hintText: "findproduct".tr,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200]),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.07,
                        //color: Colors.red,
                      ),
                    ],
                  ),
                ],
              )),
        ),
      )),
    );
  }
}
