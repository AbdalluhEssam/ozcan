import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
                  ListWheelScrollView(
                    scrollBehavior: ScrollBehavior(
                        androidOverscrollIndicator:
                            AndroidOverscrollIndicator.stretch),
                    itemExtent: Get.height,
                    physics: FixedExtentScrollPhysics(),
                    perspective: RenderListWheelViewport.defaultPerspective,
                    diameterRatio: RenderListWheelViewport.defaultDiameterRatio,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    children: [
                      ...List.generate(
                        controller.images.length,
                        (index) => PhotoProdects(
                          photo_prodect:
                              '${AppLink.imageHome}/${controller.images[index]['image']}',
                        ),
                      ),
                    ],
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
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200]),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.07,
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
