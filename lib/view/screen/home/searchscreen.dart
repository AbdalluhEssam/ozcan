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
    var response = await http.get(Uri.parse("${AppLink.searchPage}?product_name=${query}"));
    if (response.statusCode == 200 || response.statusCode == 201 ||response.statusCode == 202) {
      var itemData = jsonDecode(response.body);
      if (kDebugMode) {
        print("========================================================================$itemData");
      }
      return itemData;
    }
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    controller.getData(query);
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
        future: controller.getData(query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("لا يوجد"),
            );
          }
          else if (snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else {
            if(snapshot.data!.length == 0) return Text("data");
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              shrinkWrap: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, i) => InkWell(
                onTap: () {
                  Get.toNamed(AppRoute.productDetails, arguments: {
                    // "itemsModel": ItemsModel.fromJson(snapshot.data[i]),
                    "slug" : snapshot.data[i]['slug']
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
                            image: CachedNetworkImageProvider("${snapshot.data[i]?['image']}",),
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
                              "${snapshot.data[i]?['name']}",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              " السعر : ${snapshot.data[i]?['price']}",
                              style: const TextStyle(
                                  color: AppColor.primaryColor, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
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
    // Filter the search list based on the query
    var searchResults = query.isEmpty
        ? controller.search
        : controller.search.where((element) =>
        element["name"].toString().toLowerCase().contains(query.toLowerCase())).toList();

    // Check if searchResults is not null and has elements
    if (searchResults == null || searchResults.isEmpty) {
      return Center(
        child: Text('No results found'),
      );
    }

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          query = searchResults[index]['name'];
          showResults(context);
        },
        leading: const Icon(Icons.search),
        title: Text("${searchResults[index]['name']}"),
      ),
    );
  }

}
