

import 'package:get/get.dart';
import 'package:ozcan/core/services/services.dart';

import '../../../core/class/crud.dart';
import '../../../likeapi.dart';

class MyFavoriteData {
  Crud crud;
  MyServices myServices = Get.find();
  MyFavoriteData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewFavorite, {
      "id": myServices.sharedPreferences.getString("id")
    });
    return response.fold((l) => l, (r) => r);
  }
  deleteData(String id) async {
    var response = await crud.postData(AppLink.deleteEndFavorite, {
      "id": id.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}

