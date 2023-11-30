import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ozcan/data/model/itemsmodel.dart';
import '../../../controller/home/search_controller.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../data/datasource/remote/homedata.dart';
import '../../../likeapi.dart';

class SearchScreen extends SearchDelegate {
  SearchControllerImp controller = Get.put(SearchControllerImp());
  List search = [];
  SenpData senpData = SenpData(Get.find());
  SearchData searchData = SearchData(Get.find());
  late StatusRequest statusRequest;

  Future getItemsData() async {
    var response =
        await http.post(Uri.parse(AppLink.senp), body: {"query": query});
    if (response.statusCode == 200) {
      var itemData = jsonDecode(response.body);
      if (kDebugMode) {
        print(
            "========================================================================$itemData");
      }
      return itemData;
    }
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    getItemsData();
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: getItemsData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("لا يوجد"),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              shrinkWrap: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, i) => InkWell(
                onTap: () {
                  Get.toNamed(AppRoute.productDetails, arguments: {
                    "itemsModel": ItemsModel.fromJson(snapshot.data[i]),
                  });
                },
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffECECEC),
                        ),
                        child: Center(
                          child: Image(
                            width: 120,
                            height: 100,
                            image: CachedNetworkImageProvider("${AppLink.imageItems}/${snapshot.data[i]['items_image']}",),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data[i]['items_name']}",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              " السعر : ${snapshot.data[i]['items_price']}",
                              style: const TextStyle(
                                  color: AppColor.primaryColor, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: snapshot.data[i]['items_count'] == "0"
                              ? Text("notavailable".tr,
                                  style: const TextStyle(
                                      color: AppColor.red, fontSize: 10))
                              : IconButton(
                                  onPressed: () {
                                    // controller.addCart(
                                    //     "${snapshot.data[i]['items_id']}");
                                  },
                                  icon: const Icon(Icons.add_shopping_cart)))
                    ],
                  ),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 10,
              ),
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var search = query.isEmpty
        ? controller.search
        : controller.search.where((element) =>
            element["items_name"].toString().toLowerCase().contains(query));
    return ListView.builder(
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: search.length,
        itemBuilder: (context, index) => ListTile(
              onTap: () {
                query = search.toList()[index]['items_name'];
                showResults(context);
              },
              leading: const Icon(Icons.search),
              title: Text("${search.toList()[index]['items_name']}"),
            ));
  }
}
