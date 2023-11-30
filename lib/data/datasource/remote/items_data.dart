import 'package:get/get.dart';
import 'package:ozcan/core/services/services.dart';

import '../../../core/class/crud.dart';
import '../../../likeapi.dart';

class ItemsData {
  Crud crud;
  MyServices myServices = Get.find();
  ItemsData(this.crud);
  postData(String idPro) async {
    var response = await crud.postData(AppLink.items, {
      "items_cat": idPro,
      "user_id": myServices.sharedPreferences.getString("id"),
    });
    return response.fold((l) => l, (r) => r);
  }


  getOffersData() async {
    var response = await crud.postData(AppLink.offers, {});
    return response.fold((l) => l, (r) => r);
  }
}
